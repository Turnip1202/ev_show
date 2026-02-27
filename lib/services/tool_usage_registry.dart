import '../models/environment_info.dart';

/// 所有工具的使用说明注册表
/// 包含：官方文档链接、安装建议、常用命令
class ToolUsageRegistry {
  static const Map<String, ToolUsage> _data = {
    // ── 编程语言 ─────────────────────────────────
    'python': ToolUsage(
      id: 'python',
      officialUrl: 'https://www.python.org/doc/',
      installHint:
          '访问 https://www.python.org/downloads/ 下载安装包，安装时勾选"Add Python to PATH"',
      commands: [
        ToolUsageItem(
          label: '查看版本',
          command: 'python --version',
          description: '显示当前 Python 版本号',
        ),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'python',
          description: '启动 Python 交互式终端，可直接输入代码运行',
        ),
        ToolUsageItem(
          label: '运行脚本',
          command: 'python script.py',
          description: '运行指定的 Python 脚本文件',
        ),
        ToolUsageItem(
          label: '安装包',
          command: 'pip install 包名',
          description: '使用 pip 安装第三方库，例如：pip install requests',
        ),
        ToolUsageItem(
          label: '列出已安装包',
          command: 'pip list',
          description: '查看当前环境已安装的所有第三方库',
        ),
        ToolUsageItem(
          label: '创建虚拟环境',
          command: 'python -m venv myenv',
          description: '创建名为 myenv 的隔离 Python 环境',
        ),
        ToolUsageItem(
          label: '激活虚拟环境',
          command: 'myenv\\Scripts\\activate',
          description: 'Windows 下激活虚拟环境',
        ),
      ],
    ),

    'java': ToolUsage(
      id: 'java',
      officialUrl: 'https://docs.oracle.com/en/java/',
      installHint:
          '访问 https://www.oracle.com/java/technologies/downloads/ 或安装 OpenJDK',
      commands: [
        ToolUsageItem(
          label: '查看版本',
          command: 'java -version',
          description: '显示 Java 运行时版本',
        ),
        ToolUsageItem(
          label: '查看编译器版本',
          command: 'javac -version',
          description: '显示 Java 编译器版本',
        ),
        ToolUsageItem(
          label: '运行 Java 程序',
          command: 'java -jar 程序.jar',
          description: '运行打包好的 JAR 文件',
        ),
        ToolUsageItem(
          label: '编译 Java 文件',
          command: 'javac Hello.java',
          description: '将 .java 源文件编译为 .class 字节码',
        ),
        ToolUsageItem(
          label: '查看 JAVA_HOME',
          command: 'echo %JAVA_HOME%',
          description: '查看 Java 安装根目录环境变量',
        ),
      ],
    ),

    'nodejs': ToolUsage(
      id: 'nodejs',
      officialUrl: 'https://nodejs.org/en/docs',
      installHint: '访问 https://nodejs.org/ 下载 LTS 版本安装包',
      commands: [
        ToolUsageItem(
          label: '查看版本',
          command: 'node --version',
          description: '显示 Node.js 版本号',
        ),
        ToolUsageItem(
          label: '运行脚本',
          command: 'node app.js',
          description: '运行指定的 JavaScript 文件',
        ),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'node',
          description: '启动 Node.js 交互式 REPL',
        ),
        ToolUsageItem(
          label: '初始化项目',
          command: 'npm init -y',
          description: '快速初始化一个 Node.js 项目（默认配置）',
        ),
        ToolUsageItem(
          label: '安装依赖',
          command: 'npm install',
          description: '安装 package.json 中所有依赖',
        ),
        ToolUsageItem(
          label: '全局安装工具',
          command: 'npm install -g 包名',
          description: '全局安装命令行工具，如：npm install -g typescript',
        ),
      ],
    ),

    'go': ToolUsage(
      id: 'go',
      officialUrl: 'https://go.dev/doc/',
      installHint: '访问 https://go.dev/dl/ 下载安装包',
      commands: [
        ToolUsageItem(
          label: '查看版本',
          command: 'go version',
          description: '显示 Go 版本信息',
        ),
        ToolUsageItem(
          label: '运行程序',
          command: 'go run main.go',
          description: '直接编译并运行 Go 源文件',
        ),
        ToolUsageItem(
          label: '编译程序',
          command: 'go build',
          description: '将当前包编译成可执行文件',
        ),
        ToolUsageItem(
          label: '安装依赖',
          command: 'go mod tidy',
          description: '整理模块依赖，添加缺失、删除多余',
        ),
        ToolUsageItem(
          label: '初始化模块',
          command: 'go mod init 模块名',
          description: '初始化一个新的 Go 模块',
        ),
        ToolUsageItem(
          label: '查看环境变量',
          command: 'go env',
          description: '查看 Go 所有环境配置',
        ),
      ],
    ),

    'rust': ToolUsage(
      id: 'rust',
      officialUrl: 'https://doc.rust-lang.org/book/',
      installHint:
          '运行：winget install Rustlang.Rust.MSVC 或访问 https://rustup.rs/',
      commands: [
        ToolUsageItem(
          label: '查看版本',
          command: 'rustc --version',
          description: '显示 Rust 编译器版本',
        ),
        ToolUsageItem(
          label: '编译文件',
          command: 'rustc hello.rs',
          description: '编译单个 Rust 源文件',
        ),
        ToolUsageItem(
          label: '创建项目',
          command: 'cargo new 项目名',
          description: '使用 Cargo 创建新的 Rust 项目',
        ),
        ToolUsageItem(
          label: '编译并运行',
          command: 'cargo run',
          description: '在项目目录中编译并运行 Rust 程序',
        ),
        ToolUsageItem(
          label: '更新工具链',
          command: 'rustup update',
          description: '更新 Rust 工具链到最新版本',
        ),
      ],
    ),

    'ruby': ToolUsage(
      id: 'ruby',
      officialUrl: 'https://www.ruby-lang.org/zh_cn/documentation/',
      installHint: '访问 https://rubyinstaller.org/ 下载 Windows 安装包',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'ruby --version'),
        ToolUsageItem(
          label: '运行脚本',
          command: 'ruby script.rb',
          description: '运行 Ruby 脚本文件',
        ),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'irb',
          description: '启动 Ruby 交互式环境',
        ),
        ToolUsageItem(
          label: '安装 Gem',
          command: 'gem install 包名',
          description: '安装 Ruby 第三方库',
        ),
        ToolUsageItem(
          label: '安装 Bundle 依赖',
          command: 'bundle install',
          description: '安装 Gemfile 中的所有依赖',
        ),
      ],
    ),

    'php': ToolUsage(
      id: 'php',
      officialUrl: 'https://www.php.net/manual/zh/',
      installHint: '访问 https://windows.php.net/download/ 下载 PHP for Windows',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'php --version'),
        ToolUsageItem(
          label: '运行脚本',
          command: 'php script.php',
          description: '运行 PHP 脚本',
        ),
        ToolUsageItem(
          label: '内置开发服务器',
          command: 'php -S localhost:8080',
          description: '启动内置 Web 开发服务器',
        ),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'php -a',
          description: '启动 PHP 交互式模式',
        ),
      ],
    ),

    'dotnet': ToolUsage(
      id: 'dotnet',
      officialUrl: 'https://learn.microsoft.com/zh-cn/dotnet/',
      installHint: '访问 https://dotnet.microsoft.com/download 下载 .NET SDK',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'dotnet --version'),
        ToolUsageItem(
          label: '列出已安装 SDK',
          command: 'dotnet --list-sdks',
          description: '查看所有已安装的 .NET SDK',
        ),
        ToolUsageItem(
          label: '创建控制台项目',
          command: 'dotnet new console -n 项目名',
          description: '创建新的 C# 控制台项目',
        ),
        ToolUsageItem(
          label: '运行项目',
          command: 'dotnet run',
          description: '在项目目录中编译并运行',
        ),
        ToolUsageItem(
          label: '构建项目',
          command: 'dotnet build',
          description: '编译当前项目',
        ),
        ToolUsageItem(
          label: '还原依赖',
          command: 'dotnet restore',
          description: '下载并还原项目所需 NuGet 包',
        ),
      ],
    ),

    'dart': ToolUsage(
      id: 'dart',
      officialUrl: 'https://dart.dev/guides',
      installHint: '通过安装 Flutter SDK 自动获得 Dart，或访问 https://dart.dev/get-dart',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'dart --version'),
        ToolUsageItem(
          label: '运行脚本',
          command: 'dart run main.dart',
          description: '运行 Dart 源文件',
        ),
        ToolUsageItem(
          label: '创建项目',
          command: 'dart create 项目名',
          description: '创建新的 Dart 项目',
        ),
        ToolUsageItem(
          label: '分析代码',
          command: 'dart analyze',
          description: '静态分析代码，检查错误',
        ),
        ToolUsageItem(
          label: '格式化代码',
          command: 'dart format .',
          description: '格式化当前目录所有 Dart 文件',
        ),
      ],
    ),

    'kotlin': ToolUsage(
      id: 'kotlin',
      officialUrl: 'https://kotlinlang.org/docs/home.html',
      installHint: '通过 IntelliJ IDEA 安装，或使用 Android Studio 自带的 Kotlin 插件',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'kotlin -version'),
        ToolUsageItem(
          label: '编译文件',
          command: 'kotlinc hello.kt -include-runtime -d hello.jar',
        ),
        ToolUsageItem(label: '运行 JAR', command: 'java -jar hello.jar'),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'kotlinc',
          description: '启动 Kotlin REPL',
        ),
      ],
    ),

    'scala': ToolUsage(
      id: 'scala',
      officialUrl: 'https://docs.scala-lang.org/',
      installHint: '通过 Coursier 安装：https://www.scala-lang.org/download/',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'scala -version'),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'scala',
          description: '启动 Scala REPL',
        ),
        ToolUsageItem(label: '运行脚本', command: 'scala script.scala'),
      ],
    ),

    'perl': ToolUsage(
      id: 'perl',
      officialUrl: 'https://perldoc.perl.org/',
      installHint: '访问 https://strawberryperl.com/ 下载 Windows 版本',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'perl --version'),
        ToolUsageItem(label: '运行脚本', command: 'perl script.pl'),
        ToolUsageItem(
          label: '单行模式',
          command: 'perl -e "print \\"Hello\\n\\""',
          description: '执行单行 Perl 代码',
        ),
      ],
    ),

    'lua': ToolUsage(
      id: 'lua',
      officialUrl: 'https://www.lua.org/manual/5.4/',
      installHint: '访问 https://luabinaries.sourceforge.net/ 下载 Windows 二进制文件',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'lua -v'),
        ToolUsageItem(label: '运行脚本', command: 'lua script.lua'),
        ToolUsageItem(
          label: '进入交互模式',
          command: 'lua',
          description: '启动 Lua 交互式解释器',
        ),
      ],
    ),

    'r_lang': ToolUsage(
      id: 'r_lang',
      officialUrl: 'https://www.r-project.org/',
      installHint: '访问 https://cran.r-project.org/ 下载 R for Windows',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'Rscript --version'),
        ToolUsageItem(label: '运行脚本', command: 'Rscript script.R'),
        ToolUsageItem(
          label: '安装包',
          command: 'Rscript -e "install.packages(\'ggplot2\')"',
          description: '安装 R 第三方包',
        ),
      ],
    ),

    'swift': ToolUsage(
      id: 'swift',
      officialUrl: 'https://swift.org/documentation/',
      installHint: '在 Windows 上访问 https://www.swift.org/install/windows/ 安装',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'swift --version'),
        ToolUsageItem(label: '运行脚本', command: 'swift main.swift'),
        ToolUsageItem(
          label: '创建包',
          command: 'swift package init',
          description: '初始化 Swift Package',
        ),
      ],
    ),

    // ── 包管理器 ─────────────────────────────────
    'pip': ToolUsage(
      id: 'pip',
      officialUrl: 'https://pip.pypa.io/en/stable/',
      installHint: '随 Python 自动安装，或运行：python -m ensurepip',
      commands: [
        ToolUsageItem(
          label: '安装包',
          command: 'pip install 包名',
          description: '安装第三方 Python 库',
        ),
        ToolUsageItem(label: '卸载包', command: 'pip uninstall 包名'),
        ToolUsageItem(label: '列出已安装包', command: 'pip list'),
        ToolUsageItem(
          label: '搜索包',
          command: 'pip search 关键词',
          description: '在 PyPI 搜索包（需网络）',
        ),
        ToolUsageItem(
          label: '导出依赖',
          command: 'pip freeze > requirements.txt',
          description: '将当前环境依赖导出到文件',
        ),
        ToolUsageItem(
          label: '从文件安装',
          command: 'pip install -r requirements.txt',
          description: '批量安装 requirements.txt 中的依赖',
        ),
        ToolUsageItem(label: '升级包', command: 'pip install --upgrade 包名'),
        ToolUsageItem(
          label: '查看包信息',
          command: 'pip show 包名',
          description: '查看包的详细信息和安装路径',
        ),
      ],
    ),

    'conda': ToolUsage(
      id: 'conda',
      officialUrl: 'https://docs.conda.io/projects/conda/en/latest/',
      installHint:
          '下载 Miniconda：https://docs.conda.io/en/latest/miniconda.html',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'conda --version'),
        ToolUsageItem(
          label: '列出所有环境',
          command: 'conda env list',
          description: '查看所有已创建的 conda 虚拟环境',
        ),
        ToolUsageItem(
          label: '创建新环境',
          command: 'conda create -n 环境名 python=3.11',
          description: '创建指定 Python 版本的新环境',
        ),
        ToolUsageItem(label: '激活环境', command: 'conda activate 环境名'),
        ToolUsageItem(label: '退出环境', command: 'conda deactivate'),
        ToolUsageItem(
          label: '安装包',
          command: 'conda install 包名',
          description: '在当前 conda 环境中安装包',
        ),
        ToolUsageItem(label: '更新 conda', command: 'conda update conda'),
        ToolUsageItem(label: '删除环境', command: 'conda env remove -n 环境名'),
      ],
    ),

    'npm': ToolUsage(
      id: 'npm',
      officialUrl: 'https://docs.npmjs.com/',
      installHint: '随 Node.js 自动安装',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'npm --version'),
        ToolUsageItem(label: '初始化项目', command: 'npm init -y'),
        ToolUsageItem(
          label: '安装依赖',
          command: 'npm install',
          description: '安装 package.json 中所有依赖',
        ),
        ToolUsageItem(label: '安装指定包', command: 'npm install 包名'),
        ToolUsageItem(label: '全局安装', command: 'npm install -g 包名'),
        ToolUsageItem(label: '卸载包', command: 'npm uninstall 包名'),
        ToolUsageItem(
          label: '运行脚本',
          command: 'npm run 脚本名',
          description: '运行 package.json 中定义的脚本',
        ),
        ToolUsageItem(label: '列出全局包', command: 'npm list -g --depth=0'),
        ToolUsageItem(label: '更新包', command: 'npm update'),
      ],
    ),

    'yarn': ToolUsage(
      id: 'yarn',
      officialUrl: 'https://yarnpkg.com/getting-started',
      installHint: '运行：npm install -g yarn',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'yarn --version'),
        ToolUsageItem(label: '安装依赖', command: 'yarn install'),
        ToolUsageItem(label: '添加包', command: 'yarn add 包名'),
        ToolUsageItem(label: '全局安装', command: 'yarn global add 包名'),
        ToolUsageItem(label: '运行脚本', command: 'yarn 脚本名'),
        ToolUsageItem(label: '删除包', command: 'yarn remove 包名'),
      ],
    ),

    'pnpm': ToolUsage(
      id: 'pnpm',
      officialUrl: 'https://pnpm.io/zh/',
      installHint: '运行：npm install -g pnpm 或 winget install pnpm.pnpm',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'pnpm --version'),
        ToolUsageItem(label: '安装依赖', command: 'pnpm install'),
        ToolUsageItem(label: '添加包', command: 'pnpm add 包名'),
        ToolUsageItem(label: '全局安装', command: 'pnpm add -g 包名'),
        ToolUsageItem(label: '运行脚本', command: 'pnpm run 脚本名'),
      ],
    ),

    'bun': ToolUsage(
      id: 'bun',
      officialUrl: 'https://bun.sh/docs',
      installHint: '访问 https://bun.sh/ 查看 Windows 安装说明',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'bun --version'),
        ToolUsageItem(label: '运行脚本', command: 'bun run script.ts'),
        ToolUsageItem(label: '安装依赖', command: 'bun install'),
        ToolUsageItem(label: '添加包', command: 'bun add 包名'),
        ToolUsageItem(label: '初始化项目', command: 'bun init'),
      ],
    ),

    'cargo': ToolUsage(
      id: 'cargo',
      officialUrl: 'https://doc.rust-lang.org/cargo/',
      installHint: '随 Rust 工具链自动安装（通过 rustup）',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'cargo --version'),
        ToolUsageItem(label: '创建项目', command: 'cargo new 项目名'),
        ToolUsageItem(label: '构建项目', command: 'cargo build'),
        ToolUsageItem(label: '运行项目', command: 'cargo run'),
        ToolUsageItem(label: '运行测试', command: 'cargo test'),
        ToolUsageItem(
          label: '添加依赖',
          command: 'cargo add 包名',
          description: '添加 crates.io 依赖到 Cargo.toml',
        ),
        ToolUsageItem(label: '发布 Release 版本', command: 'cargo build --release'),
      ],
    ),

    'maven': ToolUsage(
      id: 'maven',
      officialUrl: 'https://maven.apache.org/guides/',
      installHint: '访问 https://maven.apache.org/download.cgi 下载，并配置 PATH',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'mvn --version'),
        ToolUsageItem(label: '编译项目', command: 'mvn compile'),
        ToolUsageItem(
          label: '打包项目',
          command: 'mvn package',
          description: '编译并打包为 JAR/WAR',
        ),
        ToolUsageItem(label: '运行测试', command: 'mvn test'),
        ToolUsageItem(label: '清理构建', command: 'mvn clean'),
        ToolUsageItem(label: '跳过测试打包', command: 'mvn package -DskipTests'),
      ],
    ),

    'gradle': ToolUsage(
      id: 'gradle',
      officialUrl: 'https://docs.gradle.org/current/userguide/',
      installHint: '访问 https://gradle.org/install/ 或使用 SDKMAN 安装',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'gradle --version'),
        ToolUsageItem(label: '构建项目', command: 'gradle build'),
        ToolUsageItem(label: '运行程序', command: 'gradle run'),
        ToolUsageItem(label: '清理构建', command: 'gradle clean'),
        ToolUsageItem(
          label: '列出任务',
          command: 'gradle tasks',
          description: '查看所有可用构建任务',
        ),
      ],
    ),

    'composer': ToolUsage(
      id: 'composer',
      officialUrl: 'https://getcomposer.org/doc/',
      installHint: '访问 https://getcomposer.org/download/ 下载 Composer-Setup.exe',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'composer --version'),
        ToolUsageItem(label: '安装依赖', command: 'composer install'),
        ToolUsageItem(label: '添加包', command: 'composer require 包名'),
        ToolUsageItem(label: '更新依赖', command: 'composer update'),
        ToolUsageItem(
          label: '创建项目',
          command: 'composer create-project 模板名 目录名',
        ),
      ],
    ),

    'gem': ToolUsage(
      id: 'gem',
      officialUrl: 'https://guides.rubygems.org/',
      installHint: '随 Ruby 自动安装',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'gem --version'),
        ToolUsageItem(label: '安装 Gem', command: 'gem install 包名'),
        ToolUsageItem(label: '列出已安装', command: 'gem list'),
        ToolUsageItem(label: '卸载 Gem', command: 'gem uninstall 包名'),
        ToolUsageItem(label: '更新所有 Gem', command: 'gem update'),
      ],
    ),

    'poetry': ToolUsage(
      id: 'poetry',
      officialUrl: 'https://python-poetry.org/docs/',
      installHint:
          '运行：(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'poetry --version'),
        ToolUsageItem(label: '创建项目', command: 'poetry new 项目名'),
        ToolUsageItem(label: '安装依赖', command: 'poetry install'),
        ToolUsageItem(label: '添加包', command: 'poetry add 包名'),
        ToolUsageItem(label: '进入虚拟环境', command: 'poetry shell'),
        ToolUsageItem(label: '运行命令', command: 'poetry run python main.py'),
      ],
    ),

    'pipenv': ToolUsage(
      id: 'pipenv',
      officialUrl: 'https://pipenv.pypa.io/en/latest/',
      installHint: '运行：pip install pipenv',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'pipenv --version'),
        ToolUsageItem(
          label: '安装依赖',
          command: 'pipenv install',
          description: '安装 Pipfile 中的依赖',
        ),
        ToolUsageItem(label: '添加包', command: 'pipenv install 包名'),
        ToolUsageItem(label: '进入虚拟环境', command: 'pipenv shell'),
        ToolUsageItem(label: '运行命令', command: 'pipenv run python main.py'),
      ],
    ),

    'uv': ToolUsage(
      id: 'uv',
      officialUrl: 'https://docs.astral.sh/uv/',
      installHint: '运行：pip install uv 或 winget install astral-sh.uv',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'uv --version'),
        ToolUsageItem(label: '创建虚拟环境', command: 'uv venv'),
        ToolUsageItem(label: '安装包', command: 'uv pip install 包名'),
        ToolUsageItem(label: '同步依赖', command: 'uv sync'),
        ToolUsageItem(label: '运行脚本', command: 'uv run main.py'),
      ],
    ),

    // ── 版本管理 ─────────────────────────────────
    'pyenv': ToolUsage(
      id: 'pyenv',
      officialUrl: 'https://github.com/pyenv-win/pyenv-win',
      installHint: '运行：pip install pyenv-win 或 winget install pyenv-win',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'pyenv --version'),
        ToolUsageItem(label: '列出已安装版本', command: 'pyenv versions'),
        ToolUsageItem(
          label: '列出可安装版本',
          command: 'pyenv install --list',
          description: '查看所有可下载的 Python 版本',
        ),
        ToolUsageItem(label: '安装 Python 版本', command: 'pyenv install 3.11.5'),
        ToolUsageItem(label: '设置全局版本', command: 'pyenv global 3.11.5'),
        ToolUsageItem(
          label: '设置本地版本',
          command: 'pyenv local 3.10.0',
          description: '仅对当前目录生效',
        ),
      ],
    ),

    'nvm': ToolUsage(
      id: 'nvm',
      officialUrl: 'https://github.com/coreybutler/nvm-windows',
      installHint:
          '访问 https://github.com/coreybutler/nvm-windows/releases 下载 nvm-setup.exe',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'nvm version'),
        ToolUsageItem(label: '列出已安装版本', command: 'nvm list'),
        ToolUsageItem(label: '列出可安装版本', command: 'nvm list available'),
        ToolUsageItem(label: '安装 Node.js 版本', command: 'nvm install 20.0.0'),
        ToolUsageItem(
          label: '切换版本',
          command: 'nvm use 20.0.0',
          description: '⚠️ 需要管理员权限',
        ),
        ToolUsageItem(label: '卸载版本', command: 'nvm uninstall 18.0.0'),
      ],
    ),

    'sdkman': ToolUsage(
      id: 'sdkman',
      officialUrl: 'https://sdkman.io/usage',
      installHint: '主要用于 Linux/macOS，Windows 可通过 WSL 使用',
      commands: [
        ToolUsageItem(label: '列出可安装工具', command: 'sdk list'),
        ToolUsageItem(label: '安装 Java', command: 'sdk install java'),
        ToolUsageItem(label: '切换版本', command: 'sdk use java 17.0.0'),
        ToolUsageItem(label: '查看已安装', command: 'sdk current'),
      ],
    ),

    // ── 版本控制 ─────────────────────────────────
    'git': ToolUsage(
      id: 'git',
      officialUrl: 'https://git-scm.com/doc',
      installHint: '访问 https://git-scm.com/download/win 下载安装包',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'git --version'),
        ToolUsageItem(
          label: '初始化仓库',
          command: 'git init',
          description: '在当前目录创建 Git 仓库',
        ),
        ToolUsageItem(label: '克隆仓库', command: 'git clone 仓库地址'),
        ToolUsageItem(label: '查看状态', command: 'git status'),
        ToolUsageItem(label: '添加所有文件', command: 'git add .'),
        ToolUsageItem(label: '提交', command: 'git commit -m "提交说明"'),
        ToolUsageItem(label: '查看日志', command: 'git log --oneline'),
        ToolUsageItem(label: '拉取更新', command: 'git pull'),
        ToolUsageItem(label: '推送', command: 'git push'),
        ToolUsageItem(label: '创建分支', command: 'git checkout -b 分支名'),
        ToolUsageItem(label: '合并分支', command: 'git merge 分支名'),
        ToolUsageItem(
          label: '配置用户名',
          command: 'git config --global user.name "你的名字"',
        ),
      ],
    ),

    'svn': ToolUsage(
      id: 'svn',
      officialUrl: 'https://svnbook.red-bean.com/',
      installHint: '访问 https://tortoisesvn.net/ 下载 TortoiseSVN（含命令行工具）',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'svn --version'),
        ToolUsageItem(label: '检出仓库', command: 'svn checkout 仓库地址'),
        ToolUsageItem(label: '更新', command: 'svn update'),
        ToolUsageItem(label: '提交', command: 'svn commit -m "提交说明"'),
        ToolUsageItem(label: '查看状态', command: 'svn status'),
        ToolUsageItem(label: '添加文件', command: 'svn add 文件名'),
      ],
    ),

    'gh': ToolUsage(
      id: 'gh',
      officialUrl: 'https://cli.github.com/manual/',
      installHint: '运行：winget install GitHub.cli',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'gh --version'),
        ToolUsageItem(label: '登录 GitHub', command: 'gh auth login'),
        ToolUsageItem(label: '克隆仓库', command: 'gh repo clone 用户名/仓库名'),
        ToolUsageItem(
          label: '创建 PR',
          command: 'gh pr create',
          description: '从当前分支创建 Pull Request',
        ),
        ToolUsageItem(label: '查看 Issue', command: 'gh issue list'),
        ToolUsageItem(label: '查看工作流', command: 'gh workflow list'),
      ],
    ),

    // ── 容器 & 虚拟化 ────────────────────────────
    'docker': ToolUsage(
      id: 'docker',
      officialUrl: 'https://docs.docker.com/',
      installHint:
          '访问 https://www.docker.com/products/docker-desktop/ 下载 Docker Desktop',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'docker --version'),
        ToolUsageItem(label: '查看运行容器', command: 'docker ps'),
        ToolUsageItem(label: '查看所有容器', command: 'docker ps -a'),
        ToolUsageItem(
          label: '拉取镜像',
          command: 'docker pull 镜像名',
          description: '如：docker pull nginx',
        ),
        ToolUsageItem(
          label: '运行容器',
          command: 'docker run -d -p 8080:80 镜像名',
          description: '后台运行并映射端口',
        ),
        ToolUsageItem(label: '停止容器', command: 'docker stop 容器ID'),
        ToolUsageItem(label: '查看镜像', command: 'docker images'),
        ToolUsageItem(label: '构建镜像', command: 'docker build -t 镜像名:标签 .'),
        ToolUsageItem(label: '进入容器', command: 'docker exec -it 容器ID bash'),
        ToolUsageItem(label: '查看日志', command: 'docker logs 容器ID'),
      ],
    ),

    'kubectl': ToolUsage(
      id: 'kubectl',
      officialUrl: 'https://kubernetes.io/zh-cn/docs/reference/kubectl/',
      installHint: '运行：winget install Kubernetes.kubectl',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'kubectl version --client'),
        ToolUsageItem(label: '查看节点', command: 'kubectl get nodes'),
        ToolUsageItem(label: '查看 Pod', command: 'kubectl get pods'),
        ToolUsageItem(
          label: '查看所有命名空间',
          command: 'kubectl get pods --all-namespaces',
        ),
        ToolUsageItem(label: '部署应用', command: 'kubectl apply -f 配置.yaml'),
        ToolUsageItem(label: '查看日志', command: 'kubectl logs Pod名'),
        ToolUsageItem(
          label: '进入 Pod',
          command: 'kubectl exec -it Pod名 -- bash',
        ),
      ],
    ),

    'vagrant': ToolUsage(
      id: 'vagrant',
      officialUrl: 'https://developer.hashicorp.com/vagrant/docs',
      installHint: '访问 https://developer.hashicorp.com/vagrant/downloads 下载',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'vagrant --version'),
        ToolUsageItem(
          label: '初始化',
          command: 'vagrant init ubuntu/focal64',
          description: '初始化 Ubuntu 22.04 虚拟机配置',
        ),
        ToolUsageItem(label: '启动虚拟机', command: 'vagrant up'),
        ToolUsageItem(label: 'SSH 登录', command: 'vagrant ssh'),
        ToolUsageItem(label: '暂停虚拟机', command: 'vagrant halt'),
        ToolUsageItem(label: '销毁虚拟机', command: 'vagrant destroy'),
      ],
    ),

    // ── 编辑器 & IDE ─────────────────────────────
    'vscode': ToolUsage(
      id: 'vscode',
      officialUrl: 'https://code.visualstudio.com/docs',
      installHint: '访问 https://code.visualstudio.com/ 下载安装包',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'code --version'),
        ToolUsageItem(
          label: '打开文件夹',
          command: 'code .',
          description: '用 VS Code 打开当前目录',
        ),
        ToolUsageItem(label: '列出已安装扩展', command: 'code --list-extensions'),
        ToolUsageItem(label: '安装扩展', command: 'code --install-extension 扩展ID'),
      ],
    ),

    'vim': ToolUsage(
      id: 'vim',
      officialUrl: 'https://www.vim.org/docs.php',
      installHint: '运行：winget install vim.vim 或通过 Git for Windows 获得',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'vim --version'),
        ToolUsageItem(label: '打开文件', command: 'vim 文件名'),
        ToolUsageItem(
          label: '退出（不保存）',
          command: ':q!',
          description: '在 Vim 命令模式下输入',
        ),
        ToolUsageItem(
          label: '保存并退出',
          command: ':wq',
          description: '在 Vim 命令模式下输入',
        ),
      ],
    ),

    'nvim': ToolUsage(
      id: 'nvim',
      officialUrl: 'https://neovim.io/doc/',
      installHint: '运行：winget install Neovim.Neovim',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'nvim --version'),
        ToolUsageItem(label: '打开文件', command: 'nvim 文件名'),
        ToolUsageItem(
          label: '查看健康状态',
          command: ':checkhealth',
          description: '检查 Neovim 插件和环境状态',
        ),
      ],
    ),

    // ── 数据库 ───────────────────────────────────
    'mysql': ToolUsage(
      id: 'mysql',
      officialUrl: 'https://dev.mysql.com/doc/',
      installHint: '访问 https://dev.mysql.com/downloads/mysql/ 或安装 XAMPP',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'mysql --version'),
        ToolUsageItem(
          label: '连接数据库',
          command: 'mysql -u root -p',
          description: '以 root 用户连接，会提示输入密码',
        ),
        ToolUsageItem(
          label: '列出数据库',
          command: 'SHOW DATABASES;',
          description: '在 MySQL 命令行中执行',
        ),
        ToolUsageItem(label: '选择数据库', command: 'USE 数据库名;'),
        ToolUsageItem(label: '列出表', command: 'SHOW TABLES;'),
        ToolUsageItem(
          label: '导出数据库',
          command: 'mysqldump -u root -p 数据库名 > backup.sql',
        ),
        ToolUsageItem(
          label: '导入数据库',
          command: 'mysql -u root -p 数据库名 < backup.sql',
        ),
      ],
    ),

    'postgresql': ToolUsage(
      id: 'postgresql',
      officialUrl: 'https://www.postgresql.org/docs/',
      installHint: '访问 https://www.postgresql.org/download/windows/ 下载安装包',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'psql --version'),
        ToolUsageItem(
          label: '连接数据库',
          command: 'psql -U postgres',
          description: '以 postgres 超级用户连接',
        ),
        ToolUsageItem(
          label: '列出数据库',
          command: '\\l',
          description: '在 psql 命令行中执行',
        ),
        ToolUsageItem(label: '切换数据库', command: '\\c 数据库名'),
        ToolUsageItem(label: '列出表', command: '\\dt'),
        ToolUsageItem(label: '退出', command: '\\q'),
      ],
    ),

    'redis': ToolUsage(
      id: 'redis',
      officialUrl: 'https://redis.io/docs/',
      installHint:
          '访问 https://github.com/tporadowski/redis/releases 下载 Windows 版本',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'redis-cli --version'),
        ToolUsageItem(label: '连接服务器', command: 'redis-cli'),
        ToolUsageItem(
          label: '检查连通性',
          command: 'redis-cli ping',
          description: '返回 PONG 表示连接正常',
        ),
        ToolUsageItem(
          label: '设置键值',
          command: 'SET key value',
          description: '在 redis-cli 中执行',
        ),
        ToolUsageItem(label: '获取值', command: 'GET key'),
        ToolUsageItem(label: '查看所有键', command: 'KEYS *'),
        ToolUsageItem(label: '启动服务器', command: 'redis-server'),
      ],
    ),

    'mongodb': ToolUsage(
      id: 'mongodb',
      officialUrl: 'https://www.mongodb.com/docs/',
      installHint: '访问 https://www.mongodb.com/try/download/community 下载社区版',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'mongod --version'),
        ToolUsageItem(label: '连接数据库', command: 'mongosh'),
        ToolUsageItem(
          label: '列出数据库',
          command: 'show dbs',
          description: '在 mongosh 中执行',
        ),
        ToolUsageItem(label: '切换数据库', command: 'use 数据库名'),
        ToolUsageItem(label: '列出集合', command: 'show collections'),
        ToolUsageItem(label: '查看文档', command: 'db.集合名.find()'),
      ],
    ),

    'sqlite': ToolUsage(
      id: 'sqlite',
      officialUrl: 'https://www.sqlite.org/docs.html',
      installHint: '访问 https://www.sqlite.org/download.html 下载预编译二进制文件',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'sqlite3 --version'),
        ToolUsageItem(label: '打开/创建数据库', command: 'sqlite3 mydb.sqlite'),
        ToolUsageItem(
          label: '列出表',
          command: '.tables',
          description: '在 sqlite3 命令行中执行',
        ),
        ToolUsageItem(label: '查看表结构', command: '.schema 表名'),
        ToolUsageItem(label: '退出', command: '.quit'),
      ],
    ),

    // ── 云工具 ───────────────────────────────────
    'awscli': ToolUsage(
      id: 'awscli',
      officialUrl: 'https://docs.aws.amazon.com/cli/',
      installHint: '访问 https://aws.amazon.com/cli/ 下载 MSI 安装包',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'aws --version'),
        ToolUsageItem(
          label: '配置凭证',
          command: 'aws configure',
          description: '设置 Access Key、Secret、区域等',
        ),
        ToolUsageItem(label: '列出 S3 桶', command: 'aws s3 ls'),
        ToolUsageItem(
          label: '查看 EC2 实例',
          command: 'aws ec2 describe-instances',
        ),
        ToolUsageItem(label: '查看当前身份', command: 'aws sts get-caller-identity'),
      ],
    ),

    'gcloud': ToolUsage(
      id: 'gcloud',
      officialUrl: 'https://cloud.google.com/sdk/docs',
      installHint:
          '访问 https://cloud.google.com/sdk/docs/install 下载 Google Cloud SDK',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'gcloud --version'),
        ToolUsageItem(label: '登录', command: 'gcloud auth login'),
        ToolUsageItem(label: '列出项目', command: 'gcloud projects list'),
        ToolUsageItem(
          label: '设置默认项目',
          command: 'gcloud config set project 项目ID',
        ),
        ToolUsageItem(label: '查看配置', command: 'gcloud config list'),
      ],
    ),

    'azurecli': ToolUsage(
      id: 'azurecli',
      officialUrl: 'https://learn.microsoft.com/zh-cn/cli/azure/',
      installHint: '运行：winget install Microsoft.AzureCLI',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'az --version'),
        ToolUsageItem(label: '登录', command: 'az login'),
        ToolUsageItem(label: '列出订阅', command: 'az account list'),
        ToolUsageItem(label: '列出资源组', command: 'az group list'),
        ToolUsageItem(label: '查看当前账号', command: 'az account show'),
      ],
    ),

    'terraform': ToolUsage(
      id: 'terraform',
      officialUrl: 'https://developer.hashicorp.com/terraform/docs',
      installHint: '运行：winget install Hashicorp.Terraform',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'terraform --version'),
        ToolUsageItem(
          label: '初始化',
          command: 'terraform init',
          description: '下载 Provider 插件',
        ),
        ToolUsageItem(label: '预览变更', command: 'terraform plan'),
        ToolUsageItem(label: '应用变更', command: 'terraform apply'),
        ToolUsageItem(label: '销毁资源', command: 'terraform destroy'),
      ],
    ),

    // ── 构建工具 ─────────────────────────────────
    'make': ToolUsage(
      id: 'make',
      officialUrl: 'https://www.gnu.org/software/make/manual/',
      installHint: '通过 Git for Windows 或 winget install GnuWin32.Make 安装',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'make --version'),
        ToolUsageItem(label: '执行默认目标', command: 'make'),
        ToolUsageItem(label: '执行指定目标', command: 'make 目标名'),
        ToolUsageItem(label: '清理构建', command: 'make clean'),
      ],
    ),

    'cmake': ToolUsage(
      id: 'cmake',
      officialUrl: 'https://cmake.org/cmake/help/latest/',
      installHint: '访问 https://cmake.org/download/ 下载 Windows 安装包',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'cmake --version'),
        ToolUsageItem(
          label: '生成构建文件',
          command: 'cmake -B build',
          description: '在 build 目录生成构建系统文件',
        ),
        ToolUsageItem(label: '构建项目', command: 'cmake --build build'),
        ToolUsageItem(label: '安装', command: 'cmake --install build'),
      ],
    ),

    'ant': ToolUsage(
      id: 'ant',
      officialUrl: 'https://ant.apache.org/manual/',
      installHint: '访问 https://ant.apache.org/bindownload.cgi 下载，配置 PATH',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'ant -version'),
        ToolUsageItem(label: '执行默认目标', command: 'ant'),
        ToolUsageItem(label: '执行指定目标', command: 'ant 目标名'),
        ToolUsageItem(label: '列出目标', command: 'ant -projecthelp'),
      ],
    ),

    // ── 运行时 & 其他 ────────────────────────────
    'flutter': ToolUsage(
      id: 'flutter',
      officialUrl: 'https://docs.flutter.dev/',
      installHint:
          '访问 https://docs.flutter.dev/get-started/install/windows 安装 Flutter SDK',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'flutter --version'),
        ToolUsageItem(
          label: '诊断环境',
          command: 'flutter doctor',
          description: '检查 Flutter 开发环境是否正确配置',
        ),
        ToolUsageItem(label: '创建项目', command: 'flutter create 项目名'),
        ToolUsageItem(label: '运行应用', command: 'flutter run'),
        ToolUsageItem(
          label: '构建 Windows',
          command: 'flutter build windows --release',
        ),
        ToolUsageItem(label: '分析代码', command: 'flutter analyze'),
        ToolUsageItem(label: '运行测试', command: 'flutter test'),
        ToolUsageItem(label: '获取依赖', command: 'flutter pub get'),
        ToolUsageItem(label: '添加依赖', command: 'flutter pub add 包名'),
      ],
    ),

    'deno': ToolUsage(
      id: 'deno',
      officialUrl: 'https://deno.land/manual',
      installHint: '运行：winget install DenoLand.Deno',
      commands: [
        ToolUsageItem(label: '查看版本', command: 'deno --version'),
        ToolUsageItem(label: '运行脚本', command: 'deno run main.ts'),
        ToolUsageItem(
          label: '运行(允许网络)',
          command: 'deno run --allow-net main.ts',
        ),
        ToolUsageItem(label: '格式化代码', command: 'deno fmt'),
        ToolUsageItem(label: '检查代码', command: 'deno lint'),
      ],
    ),

    'wasm': ToolUsage(
      id: 'wasm',
      officialUrl: 'https://webassembly.org/',
      installHint: '通过 Emscripten 或语言工具链（如 Rust）获得 wasm 支持',
      commands: [
        ToolUsageItem(
          label: '查看版本',
          command: 'emcc --version',
          description: 'Emscripten 编译器版本',
        ),
        ToolUsageItem(
          label: '编译 C 到 WASM',
          command: 'emcc hello.c -o hello.js',
          description: '使用 Emscripten 编译',
        ),
      ],
    ),
  };

  /// 获取指定工具的使用说明，找不到时返回 null
  static ToolUsage? get(String id) => _data[id];

  /// 所有已配置使用说明的工具 ID
  static List<String> get allIds => _data.keys.toList();
}
