#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Paranoid Android
# SPDX-License-Identifier: Apache-2.0
"""Reconstruct the pinned camera payload; release signing belongs to the build."""
import argparse
import hashlib
import json
import zipfile
from pathlib import Path


def digest(data):
    return hashlib.sha256(data).hexdigest()


def signature(name):
    return name == "META-INF/MANIFEST.MF" or (name.startswith("META-INF/") and
            name.upper().endswith((".SF", ".RSA", ".DSA", ".EC")))


def index(archive):
    names = archive.namelist()
    if len(names) != len(set(names)):
        raise ValueError("Duplicate APK entry")
    return {name: digest(archive.read(name)) for name in sorted(names) if not signature(name)}


def index_digest(entries):
    return digest("".join(name + "\0" + value + "\n" for name, value in sorted(entries.items())).encode())


def rebuild(source, recipe, delta, output):
    recipe = json.loads(Path(recipe).read_text())
    with Path(source).open("rb") as stream:
        if hashlib.file_digest(stream, "sha256").hexdigest() != recipe["input_sha256"]:
            raise ValueError("Unsupported camera input SHA256")
    with zipfile.ZipFile(source) as base, zipfile.ZipFile(delta) as changes:
        original = index(base)
        if index_digest(original) != recipe["input_payload_index_sha256"]:
            raise ValueError("Camera input payload mismatch")
        modifications = {entry["name"]: entry for entry in recipe["changed_entries"]}
        removed = {entry["name"]: entry["sha256"] for entry in recipe["removed_entries"]}
        if len(modifications) != len(recipe["changed_entries"]) or len(removed) != len(recipe["removed_entries"]):
            raise ValueError("Duplicate camera recipe operation")
        for name, expected in removed.items():
            if original.get(name) != expected:
                raise ValueError("Camera removal preimage mismatch: " + name)
        if len(changes.namelist()) != len(set(changes.namelist())):
            raise ValueError("Duplicate camera delta entry")
        expected_changes = {name for name, entry in modifications.items() if "reuse_from" not in entry}
        if set(changes.namelist()) != expected_changes:
            raise ValueError("Unexpected camera replacement payload")
        output_index = {}
        with zipfile.ZipFile(output, "w", allowZip64=True) as target:
            for name in sorted((original.keys() - removed.keys()) | modifications.keys()):
                if name in modifications:
                    entry = modifications[name]
                    if original.get(name) != entry["before"]:
                        raise ValueError("Camera replacement preimage mismatch: " + name)
                    data = base.read(entry["reuse_from"]) if "reuse_from" in entry else changes.read(name)
                    if digest(data) != entry["after"]:
                        raise ValueError("Camera replacement hash mismatch: " + name)
                    info = zipfile.ZipInfo(name, (2009, 1, 1, 0, 0, 0))
                    info.compress_type = entry["compress_type"]
                    info.external_attr = entry["external_attr"]
                else:
                    data = base.read(name)
                    old = base.getinfo(name)
                    info = zipfile.ZipInfo(name, (2009, 1, 1, 0, 0, 0))
                    info.compress_type, info.external_attr = old.compress_type, old.external_attr
                target.writestr(info, data)
                output_index[name] = digest(data)
        if index_digest(output_index) != recipe["target_payload_index_sha256"]:
            raise ValueError("Rebuilt camera payload does not match approved reference")
    with zipfile.ZipFile(output) as target:
        if target.testzip() is not None or index_digest(index(target)) != recipe["target_payload_index_sha256"]:
            raise ValueError("Rebuilt camera ZIP validation failed")


def main():
    parser = argparse.ArgumentParser()
    for name in ("input", "recipe", "delta", "out"):
        parser.add_argument("--" + name, required=True)
    args = parser.parse_args()
    rebuild(args.input, args.recipe, args.delta, args.out)


if __name__ == "__main__":
    main()
