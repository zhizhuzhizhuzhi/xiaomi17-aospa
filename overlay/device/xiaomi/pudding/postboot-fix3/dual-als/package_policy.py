#!/usr/bin/env python3
"""Package separately compiled bridge and preserved stock policy; no stub fallback."""
import argparse
import hashlib
import struct
import zipfile
from pathlib import Path

def descriptors(data):
    if not data.startswith(b"dex\n"):
        raise ValueError("Not a DEX file")
    strings_n, strings_o, types_n, types_o = struct.unpack_from("<IIII", data, 56)
    classes_n, classes_o = struct.unpack_from("<II", data, 96)
    def string(index):
        offset = struct.unpack_from("<I", data, strings_o + index * 4)[0]
        while data[offset] & 128:
            offset += 1
        offset += 1
        return data[offset:data.index(0, offset)].decode("utf-8")
    result = set()
    for index in range(classes_n):
        type_index = struct.unpack_from("<I", data, classes_o + index * 32)[0]
        string_index = struct.unpack_from("<I", data, types_o + type_index * 4)[0]
        result.add(string(string_index))
    return result

def dex_payloads(path):
    with zipfile.ZipFile(path) as archive:
        if len(archive.namelist()) != len(set(archive.namelist())):
            raise ValueError("Duplicate ZIP entry")
        names = [n for n in archive.namelist() if n.startswith("classes") and n.endswith(".dex")]
        if not names:
            raise ValueError("DEX missing: " + str(path))
        return [archive.read(n) for n in sorted(names)]

def package(policy, expected_sha256, bridge, output):
    if hashlib.sha256(Path(policy).read_bytes()).hexdigest() != expected_sha256.strip():
        raise ValueError("Stock policy SHA256 mismatch")
    stock = dex_payloads(policy)
    compiled = dex_payloads(bridge)
    stock_classes = set().union(*(descriptors(d) for d in stock))
    bridge_classes = set().union(*(descriptors(d) for d in compiled))
    overlap = stock_classes & bridge_classes
    if overlap:
        raise ValueError("Compile-only stubs leaked into bridge: " + str(sorted(overlap)))
    required = "Lcom/xiaomi/pudding/brightness/stock/Entry;"
    if required not in bridge_classes:
        raise ValueError("Compiled Entry missing")
    all_classes = stock_classes | bridge_classes
    if any("Probe" in name or "CompileApi" in name for name in all_classes):
        raise ValueError("Development-only class in runtime")
    with zipfile.ZipFile(output, "w", zipfile.ZIP_DEFLATED) as archive:
        for index, data in enumerate(stock + compiled):
            name = "classes.dex" if index == 0 else "classes" + str(index + 1) + ".dex"
            info = zipfile.ZipInfo(name, (2009, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(info, data)

def main():
    parser = argparse.ArgumentParser()
    for name in ["policy", "sha256", "bridge", "out"]:
        parser.add_argument("--" + name, required=True)
    args = parser.parse_args()
    package(args.policy, Path(args.sha256).read_text(), args.bridge, args.out)

if __name__ == "__main__":
    main()
