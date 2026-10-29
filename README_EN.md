# AOSPA for Xiaomi 17 (pudding)

[中文](README.md)

One build-source kit for AOSPA Calcite / Android 17: pinned AOSPA/device/SM8850 sources, patches, overlays, prepared-input hashes, and build/packaging tools. Original upstream attribution is retained.

## Upstream sources and acknowledgements

This project builds on [lolipuru](https://github.com/lolipuru)'s LineageOS device bring-up for Xiaomi 17 (pudding), adapted for AOSPA Calcite / Android 17 with local integration changes. It uses these upstream repositories:

- [Pudding device tree](https://github.com/lolipuru/android_device_xiaomi_pudding): `device/xiaomi/pudding`.
- [SM8850 common device tree](https://github.com/lolipuru/android_device_xiaomi_sm8850-common): `device/xiaomi/sm8850-common`.
- [SM8850 common vendor](https://github.com/lolipuru/android_vendor_xiaomi_sm8850-common): `vendor/xiaomi/sm8850-common`.

**Thank you to lolipuru for the device bring-up and maintenance, and to AOSPA, LineageOS and the other upstream contributors.** Original copyrights and licenses are retained. Base commits are recorded in [source-origins.json](source-origins.json); local adaptation changes are in `patches/` and `overlay/`.

## Checkout

Use Ubuntu 22.04/24.04 x86_64 with Android build dependencies, git-lfs and repo installed. 64 GB RAM and 500 GB free storage are recommended.

```sh
git clone https://github.com/zhizhuzhizhuzhi/xiaomi17-aospa.git aospa-pudding-kit
mkdir android-pudding && cd android-pudding
repo init -u https://github.com/zhizhuzhizhuzhi/xiaomi17-aospa.git -b main -m manifests/release.xml --git-lfs
repo sync -c --no-tags -j8
bash ../aospa-pudding-kit/scripts/prepare.sh "$PWD" /path/to/prepared-pudding-inputs
```

`dependencies.json` pins 5401 prepared inputs by path, size and SHA256. The prepared-input root must preserve those relative paths. Arbitrary stock replacements are rejected. See [INPUTS.md](docs/INPUTS.md). Proprietary payloads, firmware archives and private signing keys are supplied separately.

## Build

```sh
BUILD_NUMBER=20261029 bash ../aospa-pudding-kit/scripts/build.sh "$PWD" userdebug "$(nproc)"
OUT_DIR=out-pudding-userdebug python3 ../aospa-pudding-kit/scripts/package.py "$PWD" \
  out-pudding-userdebug/target/product/pudding/obj/PACKAGING/target_files_intermediates/aospa_pudding-target_files.zip \
  "$PWD/aospa_pudding-fastboot-userdebug.zip"
```

For user, select `user` and use `OUT_DIR=out-pudding-user`. The matched 6.12 prebuilt kernel is reused. Fastboot packaging checks the complete target-files A/B image set, including firmware, against source images and verifies ZIP CRC and SHA256.

Public defaults use development signing. Private APK certificate overrides are opt-in through `PUDDING_RELEASE_KEYS` with matching key/module definitions. `PUDDING_AVB_KEY_PATH` selects an existing AVB key. Selecting user does not perform release signing.

This packages the current source snapshot, including rear-light darkening protection. It is not a new full-build or hardware-validation claim. See [VALIDATION.md](docs/VALIDATION.md) and [licensing](LICENSE.md).
