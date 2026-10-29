# 输入来源与准备

设备及 SM8850 平台的上游仓库/提交见 `source-origins.json`，其余项目由 `manifests/release.xml` 固定。补丁基线来自对应 Git 提交；平台归档中的 Git commit 标记用于固定原始版本。

`dependencies.json` 记录当前源码实际使用的兼容输入，不把旧手机数据备份当构建输入。其中包含当前 OS4 内核、模块、头文件，Xiaomi/QCOM 专有库、应用、固件和界面资源。内核、DTB、DTBO、ramdisk 与 DLKM 模块需要同一匹配组合；不要混用 HyperOS 318 的旧内核。

准备目录保留各条 `destination` 相对路径。例如 `device/xiaomi/pudding-kernel-os4/kernel`、`vendor/xiaomi/pudding/proprietary/...` 和 `vendor/xiaomi/sm8850-common/proprietary/...`。已有匹配源码树中的输入可作为准备源。若从原厂包开始，先按设备 `extract-files.py` / proprietary-files 清单提取，再完成对应兼容处理；单纯 stock extraction 是否能生成全部输入尚未重新验证。

```sh
python3 scripts/fetch-dependencies.py /path/to/android --source /path/to/prepared-inputs --replace-stock-inputs
python3 scripts/fetch-dependencies.py /path/to/android --verify
```

`--replace-stock-inputs` 明确允许把 checkout 中的原始专有文件替换为清单固定的准备版本。所有候选文件先检查大小与 SHA256，再开始安装；任何缺失会在替换前失败。此参数不关闭校验。

部分历史兼容库需要额外修补后才能匹配哈希，原始固件文件不一定等于最终输入。当前清单是输入契约，不声称已提供所有兼容二进制的自动重建工具。私有密钥不属于输入清单。
