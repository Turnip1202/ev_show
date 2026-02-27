<div align="center">

<img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter" />
<img src="https://img.shields.io/badge/Platform-Windows-0078D4?logo=windows" />
<img src="https://img.shields.io/badge/License-MIT-green" />
<img src="https://img.shields.io/badge/Version-1.0.0-blue" />

# 🖥️ ev_show · 环境管家

**一键扫描电脑上所有已安装的开发环境，让非程序员也能看懂。**

*One-click scan for all installed development environments on your PC — readable even by non-developers.*

[简体中文](#-简体中文) · [English](#-english)

</div>

---

## 🇨🇳 简体中文

### 📖 项目简介

**ev_show（环境管家）** 是一款运行于 Windows 桌面的 Flutter 应用，专为需要了解电脑开发环境的普通用户和 IT 管理人员设计。

它能自动检测电脑上安装的几十种常见开发工具（Python、Java、Node.js、Docker 等），以直观的卡片式界面展示版本号、安装路径和使用说明，让完全不懂编程的人也能一眼明白电脑上装了什么。

### ✨ 功能特性

- 🔍 **自动扫描** — 启动即扫描，一键刷新，并发检测提升速度
- 📦 **50+ 工具支持** — 覆盖编程语言、包管理器、版本管理、版本控制、容器、数据库、云工具、构建工具等 10 大分类
- 🐳 **Docker 深度监测** — 显示守护进程状态、运行中容器、镜像数量、磁盘占用
- 📋 **使用说明内置** — 每个工具附带常用命令、安装建议、官方文档链接，点击命令即可一键复制
- 🗂️ **分类折叠** — 按工具类型分组，点击标题一键折叠/展开，界面整洁
- 🔎 **搜索 & 筛选** — 支持名称/描述搜索、按分类筛选、只看已安装
- 🌗 **深色/浅色主题** — 跟随系统自动切换
- ⚠️ **环境变量提示** — 提醒用户刚安装软件时可能需要重启应用

### 📸 界面预览

```
┌─────────────────────────────────────────────────────────┐
│  🖥️ 环境管家  ev_show · Windows       42 / 58 已安装   🔄 │
├─────────────────────────────────────────────────────────┤
│  🔍 搜索工具名称、描述...                                  │
│  [仅显示已安装] [编程语言] [包管理器] [容器] ...           │
├─────────────────────────────────────────────────────────┤
│  🔵 编程语言   12 / 15 已安装                         ∨  │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐  │
│  │ Python   │ │  Java    │ │ Node.js  │ │   Go     │  │
│  │ v3.11.5  │ │ v17.0.2  │ │ v20.1.0  │ │  未安装  │  │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘  │
├─────────────────────────────────────────────────────────┤
│  🟣 包管理器   8 / 10 已安装                          ∨  │
│  ...                                                    │
└─────────────────────────────────────────────────────────┘
```

### 🛠️ 支持的工具

<details>
<summary>点击展开完整列表（58 种）</summary>

| 分类 | 工具 |
|------|------|
| **编程语言** | Python、Java、Node.js、Go、Rust、Ruby、PHP、.NET/C#、Dart、Kotlin、Scala、Perl、Lua、R、Swift |
| **包管理器** | pip、conda、npm、yarn、pnpm、bun、cargo、Maven、Gradle、Composer、RubyGems、Poetry、Pipenv、uv |
| **版本管理** | pyenv、nvm、SDKMAN! |
| **版本控制** | Git、SVN、GitHub CLI |
| **容器 & 虚拟化** | Docker（深度监测）、kubectl、Podman、Helm、Vagrant、Minikube |
| **编辑器 & IDE** | VS Code、VS Code Insiders、Vim、Neovim |
| **数据库** | MySQL、PostgreSQL、Redis、MongoDB、SQLite |
| **云工具** | AWS CLI、Azure CLI、gcloud、Terraform、Heroku CLI |
| **构建工具** | Make、CMake、Ninja、Ant |
| **运行时 & 其他** | Flutter、Android ADB、Deno、WSL、Nginx |

</details>

### 🚀 快速开始

#### 环境要求

- Windows 10 / 11（64-bit）
- [Flutter SDK](https://docs.flutter.dev/get-started/install/windows) 3.x 及以上
- [Visual Studio 2022 Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)（需勾选"使用 C++ 的桌面开发"工作负载）

#### 克隆并运行

```powershell
# 克隆仓库
git clone https://github.com/your-username/ev_show.git
cd ev_show

# 获取依赖
flutter pub get

# 调试模式运行
flutter run -d windows

# 编译 Release 版本
flutter build windows --release
# 生成的 exe 位于: build\windows\x64\runner\Release\ev_show.exe
```

#### 直接下载（无需开发环境）

前往 [Releases](https://github.com/your-username/ev_show/releases) 页面下载最新版 `.zip`，解压后双击运行即可。

### 📝 使用说明

1. **启动应用** — 程序启动后自动开始扫描，通常 5~15 秒完成
2. **查看结果** — 绿色徽章表示已安装，灰色表示未检测到
3. **点击卡片** — 进入详情页，查看版本号、安装路径、常用命令和官方文档
4. **复制命令** — 在详情页点击命令右侧的复制图标，一键复制到剪贴板
5. **折叠分类** — 点击分类标题栏可折叠/展开该分类，保持界面整洁
6. **刷新扫描** — 点击右上角刷新按钮重新扫描

> ⚠️ **注意**：如果刚安装了新软件但扫描不到，请先**重启本程序**再扫描。这是因为 Windows 环境变量在当前进程启动后不会自动刷新。

### 🏗️ 项目结构

```
lib/
├── main.dart                      # 应用入口 & 主题配置
├── models/
│   └── environment_info.dart      # 数据模型（EnvironmentInfo、ToolUsage 等）
├── providers/
│   └── scan_provider.dart         # 状态管理（Provider）
├── screens/
│   ├── home_screen.dart           # 主界面
│   └── env_detail_screen.dart     # 工具详情页
├── services/
│   ├── environment_registry.dart  # 所有工具的显示元数据注册表
│   ├── scanner_service.dart       # 环境扫描核心逻辑
│   └── tool_usage_registry.dart   # 工具使用说明 & 命令数据库
└── widgets/
    └── env_card.dart              # 环境卡片组件
```

### 🔧 工作原理

ev_show 通过系统 Shell 调用每个工具的版本命令（如 `python --version`）来检测其是否安装：

- **PATH 扫描** — 使用 `where <可执行文件>` 定位二进制文件，无需读取注册表
- **并发检测** — 工具以每批 8 个并发执行，最小化总扫描时间
- **超时保护** — 每条命令设有 10 秒超时，防止无响应工具导致卡死
- **stderr 兼容** — `java -version` 等将输出写入 stderr 的工具同样正确处理
- **深度信息采集** — Docker、conda、Git、nvm、pyenv 等支持额外命令采集更丰富的上下文

### 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

**新增工具支持**需要修改三个文件：
1. `environment_registry.dart` — 添加显示名称、图标、分类等元数据
2. `scanner_service.dart` — 添加扫描命令定义
3. `tool_usage_registry.dart` — 添加使用说明和常用命令

**报告 Bug** — 请在 Issue 中附上您的操作系统版本和相关输出信息

**功能建议** — 在 Issue 中描述您的使用场景

### 📄 开源协议

本项目基于 [MIT License](LICENSE) 开源，可自由使用、修改和分发。

---

## 🇬🇧 English

### 📖 About

**ev_show (Environment Manager)** is a Windows desktop application built with Flutter. It's designed for IT administrators and non-technical users who need to know what development tools are installed on a machine.

It automatically detects dozens of common dev tools (Python, Java, Node.js, Docker, etc.), displaying version numbers, install paths, and usage guides in a clean card-based UI that anyone can understand.

### ✨ Features

- 🔍 **Auto Scan** — Scans on startup, one-click refresh, concurrent detection for speed
- 📦 **50+ Tools** — Covers 10 categories: languages, package managers, version managers, VCS, containers, databases, cloud tools, build tools, and more
- 🐳 **Deep Docker Inspection** — Shows daemon status, running containers, image count, disk usage
- 📋 **Built-in Usage Guide** — Every tool includes common commands, install hints, and official docs link; click any command to copy it
- 🗂️ **Collapsible Categories** — Tools grouped by type; click a header to collapse/expand with smooth animation
- 🔎 **Search & Filter** — Filter by name/description, category, or installed-only
- 🌗 **Dark / Light Theme** — Follows system preference automatically
- ⚠️ **Environment Variable Notice** — Reminds users to restart after installing new software

### 🛠️ Supported Tools

<details>
<summary>Click to expand full list (58 tools)</summary>

| Category | Tools |
|----------|-------|
| **Languages** | Python, Java, Node.js, Go, Rust, Ruby, PHP, .NET/C#, Dart, Kotlin, Scala, Perl, Lua, R, Swift |
| **Package Managers** | pip, conda, npm, yarn, pnpm, bun, cargo, Maven, Gradle, Composer, RubyGems, Poetry, Pipenv, uv |
| **Version Managers** | pyenv, nvm, SDKMAN! |
| **Version Control** | Git, SVN, GitHub CLI |
| **Containers & Virtualization** | Docker (deep inspection), kubectl, Podman, Helm, Vagrant, Minikube |
| **Editors & IDEs** | VS Code, VS Code Insiders, Vim, Neovim |
| **Databases** | MySQL, PostgreSQL, Redis, MongoDB, SQLite |
| **Cloud Tools** | AWS CLI, Azure CLI, gcloud, Terraform, Heroku CLI |
| **Build Tools** | Make, CMake, Ninja, Ant |
| **Runtime & Others** | Flutter, Android ADB, Deno, WSL, Nginx |

</details>

### 🚀 Getting Started

#### Prerequisites

- Windows 10 / 11 (64-bit)
- [Flutter SDK](https://docs.flutter.dev/get-started/install/windows) 3.x or higher
- [Visual Studio 2022 Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022) with **"Desktop development with C++"** workload

#### Clone & Run

```powershell
# Clone the repository
git clone https://github.com/your-username/ev_show.git
cd ev_show

# Install dependencies
flutter pub get

# Run in debug mode
flutter run -d windows

# Build release executable
flutter build windows --release
# Output: build\windows\x64\runner\Release\ev_show.exe
```

#### Download Pre-built Binary

Visit the [Releases](https://github.com/your-username/ev_show/releases) page to download the latest `.zip`, then unzip and run directly — no development environment needed.

### 📝 How to Use

1. **Launch** — The app scans automatically on startup; usually takes 5–15 seconds
2. **Read results** — Green badge = installed, grey = not detected
3. **Click a card** — Opens the detail view with version, install path, common commands, and docs link
4. **Copy commands** — Click the copy icon next to any command in the detail view
5. **Collapse categories** — Click any category header to collapse/expand its tools
6. **Re-scan** — Click the refresh button (top right) to rescan

> ⚠️ **Note**: If you just installed new software but it doesn't appear, **restart ev_show** and scan again. Windows environment variables are captured at process startup and won't refresh automatically within a running process.

### 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point & theme config
├── models/
│   └── environment_info.dart      # Data models (EnvironmentInfo, ToolUsage, etc.)
├── providers/
│   └── scan_provider.dart         # State management (Provider)
├── screens/
│   ├── home_screen.dart           # Main screen
│   └── env_detail_screen.dart     # Tool detail screen
├── services/
│   ├── environment_registry.dart  # Display metadata registry for all tools
│   ├── scanner_service.dart       # Core scanning logic
│   └── tool_usage_registry.dart   # Commands & usage guide database
└── widgets/
    └── env_card.dart              # Environment card widget
```

### 🔧 How It Works

ev_show uses `Process.run()` to invoke each tool's version command via the system shell:

- **PATH-based scanning** — Uses `where <executable>` to locate binaries; no registry reads required for most tools
- **Concurrent detection** — Tools are scanned in batches of 8 concurrently to minimize total scan time
- **Graceful timeouts** — Each command has a 10-second timeout to avoid hanging on unresponsive tools
- **stderr awareness** — Tools like `java -version` write to stderr; the scanner handles both stdout and stderr correctly
- **Extra info collectors** — Docker, conda, Git, nvm, pyenv run additional commands to surface richer context

### 🤝 Contributing

Issues and Pull Requests are welcome!

**To add a new tool**, modify three files:
1. `environment_registry.dart` — Add display name, icon, and category metadata
2. `scanner_service.dart` — Add the scan command definition
3. `tool_usage_registry.dart` — Add usage guide and common commands

**To report a bug** — Please include your OS version and the raw command output in the issue.

**Feature requests** — Describe your use case in an issue.

### 📄 License

This project is open-sourced under the [MIT License](LICENSE). Free to use, modify, and distribute.

---

<div align="center">

Made with ❤️ using [Flutter](https://flutter.dev)

If this project helped you, please consider giving it a ⭐

</div>

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
