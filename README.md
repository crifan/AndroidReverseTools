# AndroidReverseTools

Update: `20260603`

## Repo

https://github.com/crifan/AndroidReverseTools

https://github.com/crifan/AndroidReverseTools.git

## Function

Collect Android reverse related tools

收集和整理安卓逆向开发相关工具

## Structure

```
.
├── FileManager/             # 文件管理器
│   └── MT/                  # MT管理器
├── JEB/                     # JEB反编译器（大文件外链）
├── Windows/                 # Windows平台工具
│   ├── AndroidKiller/       # APK逆向分析工具
│   ├── DevXUnityUnpacker/   # Unity资源解包工具
│   └── GDA/                 # GDA反编译器
├── debuggable/              # 开启调试模式
│   ├── BDOpener/            # 调试开关工具
│   └── mprop/               # 修改系统属性（ro.debuggable）
├── decompile/               # 反编译工具集
│   ├── CFR/                 # Java反编译器
│   ├── FDex/                # 脱壳工具
│   ├── Procyon/             # Java反编译器
│   ├── apktool/             # APK反编译/回编译
│   ├── dex-tools/           # dex2jar等dex工具
│   ├── dumpDex/             # 脱壳工具
│   ├── jadx/                # DEX/APK反编译器
│   ├── jd-gui/              # Java反编译GUI
│   ├── luyten/              # Java反编译GUI
│   └── xml/                 # Android XML解析工具
│       ├── AXMLPrinter2/
│       └── axmldec/
├── deobfuscation/           # 反混淆工具
│   └── simplify/            # Android反混淆器
├── elf/                     # ELF分析脚本
├── exportSplitApk/          # Split APK导出/合并
│   ├── AntiSplit-M/         # APK合并工具
│   ├── SAI/                 # Split APK安装器
│   └── bundletool/          # Google官方bundle工具
├── root_hook/               # Root与Hook框架
│   ├── EdXposed/            # EdXposed框架
│   ├── LSPosed/             # LSPosed框架
│   ├── Magisk/              # Magisk Root框架
│   │   ├── KitsuneMask_MagiskDelta/
│   │   └── Magisk/
│   ├── Plugins_Modules/     # 插件模块
│   │   ├── AntiRootDetection/   # 隐藏Root
│   │   ├── Cerificate/          # 证书相关
│   │   ├── CrossCompiledBinaries/
│   │   ├── FakeLocation/        # 虚拟定位
│   │   ├── Riru/
│   │   └── bypassSslPinning/    # 绕过SSL Pinning
│   ├── TWRP/                # TWRP Recovery
│   ├── XPosed/              # Xposed框架
│   ├── rootDetection/       # Root检测工具
│   └── 太极/                # 太极（免Root使用Xposed）
└── smali/                   # Smali工具
    ├── JesusFreke/          # smali/baksmali
    ├── SmaliViewer/         # Smali查看器
    └── smalidea/            # Smali IDE插件
```

## Tools List

### 反编译 (decompile)

| 工具 | 版本 | 说明 |
|------|------|------|
| [jadx](decompile/jadx/) | 1.5.5 | DEX/APK反编译为Java源码，支持GUI和命令行 |
| [apktool](decompile/apktool/) | 2.9.0 | APK反编译/回编译，提取资源文件 |
| [dex-tools](decompile/dex-tools/) | 2.1-SNAPSHOT | dex2jar等dex转换工具集 |
| [jd-gui](decompile/jd-gui/) | 1.4.1 | Java class文件反编译GUI |
| [CFR](decompile/CFR/) | 0.152 | Java反编译器 |
| [Procyon](decompile/Procyon/) | 0.5.36 | Java反编译器 |
| [luyten](decompile/luyten/) | 0.5.4 | 基于Procyon的GUI反编译器 |
| [FDex2](decompile/FDex/) | 1.1 | 脱壳工具，Hook ClassLoader导出dex |
| [dumpDex](decompile/dumpDex/) | 1.1 | 脱壳工具，内存dump dex |
| [AXMLPrinter2](decompile/xml/AXMLPrinter2/) | - | Android二进制XML转文本XML |
| [axmldec](decompile/xml/axmldec/) | 1.2.0 | Android二进制XML解码器 |

### JEB反编译器

| 工具 | 版本 | 说明 |
|------|------|------|
| [JEB](JEB/) | 5.14.0 | 专业Android逆向分析平台（大文件外链下载） |

### Smali工具 (smali)

| 工具 | 版本 | 说明 |
|------|------|------|
| [smali/baksmali](smali/JesusFreke/) | 2.5.2 | dex与smali互转的标准工具 |
| [SmaliViewer](smali/SmaliViewer/) | - | Smali代码查看器 |
| [smalidea](smali/smalidea/) | 0.06 | IntelliJ IDEA/Android Studio的Smali调试插件 |

### 反混淆 (deobfuscation)

| 工具 | 版本 | 说明 |
|------|------|------|
| [simplify](deobfuscation/simplify/) | 1.3.0 | Android反混淆器，简化混淆代码 |

### Root与Hook框架 (root_hook)

| 工具 | 版本 | 说明 |
|------|------|------|
| [Magisk](root_hook/Magisk/Magisk/) | 30.4 | 主流Root框架，支持MagiskHide |
| [KitsuneMask](root_hook/Magisk/KitsuneMask_MagiskDelta/) | 26.4/27001 | Magisk Delta分支 |
| [LSPosed](root_hook/LSPosed/) | 1.10.1 | 现代Xposed框架（基于Zygisk） |
| [EdXposed](root_hook/EdXposed/) | 0.5.2.2 | Xposed框架（基于Riru/YAHFA） |
| [Xposed](root_hook/XPosed/) | 多版本 | 经典Xposed框架及安装器 |
| [太极](root_hook/太极/) | 5.1.1 | 免Root使用Xposed模块 |
| [TWRP](root_hook/TWRP/) | 3.6.2 | 第三方Recovery（Pixel 3） |

### Root/Hook插件模块 (Plugins_Modules)

| 工具 | 版本 | 说明 |
|------|------|------|
| [Shamiko](root_hook/Plugins_Modules/AntiRootDetection/Shamiko/) | 1.2.1 | 隐藏Root（配合Magisk DenyList） |
| [JustTrustMe](root_hook/Plugins_Modules/bypassSslPinning/JustTrustMe/) | - | 绕过SSL Pinning（Xposed模块） |
| [TrustMeAlready](root_hook/Plugins_Modules/bypassSslPinning/TrustMeAlready/) | - | 绕过SSL Pinning |
| [MoveCertificate](root_hook/Plugins_Modules/Cerificate/MoveCertificate/) | - | 将用户证书移至系统证书 |
| [AlwaysTrustUserCerts](root_hook/Plugins_Modules/Cerificate/AlwaysTrustUserCerts/) | - | 始终信任用户证书 |
| [Riru](root_hook/Plugins_Modules/Riru/) | 26.1.7 | Zygote注入框架 |
| [FakeLocation](root_hook/Plugins_Modules/FakeLocation/) | 1.3.10 | 虚拟定位 |
| [Cross Compiled Binaries](root_hook/Plugins_Modules/CrossCompiledBinaries/) | 9.2-14 | 交叉编译工具集 |

### Root检测 (rootDetection)

| 工具 | 版本 | 说明 |
|------|------|------|
| [momo](root_hook/rootDetection/momo/) | 4.4.1 | Root/环境异常检测 |
| [Hunter](root_hook/rootDetection/Hunter/) | 6.0.6 | Root检测工具 |
| [MagiskHidePropsConf](root_hook/rootDetection/MagiskHidePropsConf/) | 6.1.2 | 修改设备指纹隐藏Root |

### 开启调试模式 (debuggable)

| 工具 | 版本 | 说明 |
|------|------|------|
| [BDOpener](debuggable/BDOpener/) | - | 调试开关工具 |
| [mprop](debuggable/mprop/) | 多版本 | 修改系统ro属性（如ro.debuggable） |

### Split APK处理 (exportSplitApk)

| 工具 | 版本 | 说明 |
|------|------|------|
| [AntiSplit-M](exportSplitApk/AntiSplit-M/) | 2.2.6 | Split APK合并工具 |
| [SAI](exportSplitApk/SAI/) | 4.5 | Split APK安装器 |
| [bundletool](exportSplitApk/bundletool/) | 1.18.2 | Google官方AAB/APK处理工具 |

### 文件管理器 (FileManager)

| 工具 | 版本 | 说明 |
|------|------|------|
| [MT管理器](FileManager/MT/) | 2.26.2 | Android文件管理+APK编辑器 |

### Windows平台工具 (Windows)

| 工具 | 版本 | 说明 |
|------|------|------|
| [AndroidKiller](Windows/AndroidKiller/) | 1.3.1 | APK反编译/回编译/签名一体化工具 |
| [DevXUnityUnpacker](Windows/DevXUnityUnpacker/) | 2.73 | Unity游戏资源解包工具 |
| [GDA](Windows/GDA/) | 4.02 | 国产Android逆向分析工具 |

### ELF分析脚本 (elf)

| 工具 | 说明 |
|------|------|
| [batchExportElfInfo.sh](elf/batchExportElfInfo.sh) | 批量导出ELF信息 |
| [exportElf_StrResInfo.sh](elf/exportElf_StrResInfo.sh) | 导出ELF字符串资源信息 |

## Usage

```bash
git clone https://github.com/crifan/AndroidReverseTools.git
```

> 注：部分大文件通过外链提供下载，详见各子目录README

## Related

* [Android逆向开发](https://book.crifan.org/books/android_reverse_dev/website/) - crifan的电子书
