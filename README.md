# Xiaomi 17（pudding）AOSPA 构建

[English](README_EN.md)

AOSPA Calcite / Android 17，产品 `aospa_pudding`。源码获取、设备适配、SM8850 平台补丁、输入校验和构建打包入口集中在本仓库。

## 环境

Ubuntu 22.04 / 24.04，x86_64，建议 64 GB 内存、500 GB 可用磁盘。

```sh
sudo apt update
sudo apt install git git-lfs curl python3 python-is-python3 build-essential zip unzip rsync bc bison flex gperf ccache libssl-dev libelf-dev libncurses-dev libxml2-utils xsltproc zlib1g-dev liblz4-tool
mkdir -p "$HOME/bin"
curl -o "$HOME/bin/repo" https://storage.googleapis.com/git-repo-downloads/repo
chmod +x "$HOME/bin/repo"
export PATH="$HOME/bin:$PATH"
git lfs install
```

## 获取源码

```sh
git clone https://github.com/zhizhuzhizhuzhi/xiaomi17-aospa.git aospa-pudding-kit
mkdir android-pudding
cd android-pudding
repo init -u https://github.com/zhizhuzhizhuzhi/xiaomi17-aospa.git -b main -m manifests/release.xml --git-lfs
repo sync -c --no-tags -j8
```

manifest 固定 AOSPA 基线、lolipuru 设备树和 SM8850 平台来源；`source-origins.json` 记录设备和平台组件版本。原始版权与许可证保留，本地修改在 `patches/` 和 `overlay/` 中。

## 准备设备输入

`dependencies.json` 固定 5401 项兼容输入，包括当前 OS4 内核、DTB、DTBO、模块、头文件、固件和专有组件。它们按构建使用的相对路径收录，准备目录需保持同样结构。

```sh
bash ../aospa-pudding-kit/scripts/prepare.sh "$PWD" /path/to/prepared-pudding-inputs
```

准备目录可以来自现有匹配构建树的输入归档。原厂文件必须经过对应提取及兼容处理，不能只换成任意更新版本。脚本会先核验全部输入，再安装；不匹配时停止。详见 [输入说明](docs/INPUTS.md)。本仓库不包含固件包、专有二进制和私有签名密钥。

## 编译和打包

### userdebug

```sh
BUILD_NUMBER=20261029 bash ../aospa-pudding-kit/scripts/build.sh "$PWD" userdebug "$(nproc)"
OUT_DIR=out-pudding-userdebug python3 ../aospa-pudding-kit/scripts/package.py "$PWD" \
  out-pudding-userdebug/target/product/pudding/obj/PACKAGING/target_files_intermediates/aospa_pudding-target_files.zip \
  "$PWD/aospa_pudding-fastboot-userdebug.zip"
```

### user

```sh
BUILD_NUMBER=20261029 bash ../aospa-pudding-kit/scripts/build.sh "$PWD" user "$(nproc)"
OUT_DIR=out-pudding-user python3 ../aospa-pudding-kit/scripts/package.py "$PWD" \
  out-pudding-user/target/product/pudding/obj/PACKAGING/target_files_intermediates/aospa_pudding-target_files.zip \
  "$PWD/aospa_pudding-fastboot-user.zip"
```

两种变体使用独立输出目录。Pudding 使用匹配的 6.12 预编译内核，不运行 SM8550 的内核构建流程。打包按 target-files 的 A/B 分区清单选择全部系统及固件镜像，并核对镜像来源、ZIP CRC 和整包 SHA256。

公开配置默认使用开发签名。私有 APK 证书映射仅在设置 `PUDDING_RELEASE_KEYS` 并提供对应密钥/模块时启用；`PUDDING_AVB_KEY_PATH` 可指定自己的现有 AVB 密钥。选择 `user` 本身不等于完成正式签名。

## 目录

- `manifests/`：固定源码版本。
- `patches/`、`overlay/`、`projects.json`：源码修改与校验。
- `source-origins.json`：设备树和 SM8850 平台来源。
- `dependencies.json`：输入哈希清单。
- `scripts/`：准备、构建和 Fastboot 打包。
- `licenses/`：上游许可证。

本仓库整理的是当前源码快照，含后置光感防误降亮修改。本次检查不代表重新完成全量编译或实机验证，详见 [验证记录](docs/VALIDATION.md)。
