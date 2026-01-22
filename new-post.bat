@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo    Hugo 新文章创建工具
echo ========================================
echo.

:: 获取文章标题
set /p title="请输入文章标题: "
if "%title%"=="" (
    echo 错误: 标题不能为空！
    pause
    exit /b 1
)

:: 选择分类
echo.
echo 请选择文章分类:
echo   1. ai          - AI 相关
echo   2. programming - 编程相关
echo.
set /p category_choice="请输入数字 (1 或 2): "

if "%category_choice%"=="1" (
    set category=ai
) else if "%category_choice%"=="2" (
    set category=programming
) else (
    echo 无效选择，默认使用 programming
    set category=programming
)

:: 生成文件名（将空格替换为连字符，转小写）
set filename=%title: =-%

:: 获取当前日期
for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
    set year=%%a
    set month=%%b
    set day=%%c
)
set today=%year%-%month%-%day%

:: 创建文章
set filepath=content\posts\%category%\%filename%.md

echo.
echo 正在创建文章: %filepath%

:: 使用 hugo new 命令创建文章
hugo new posts/%category%/%filename%.md

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo 文章创建成功！
    echo 文件路径: %filepath%
    echo ========================================
    echo.
    echo 提示: 编辑完成后，将 draft: true 改为 draft: false 即可发布
    echo.

    :: 询问是否用 VS Code 打开
    set /p open_vscode="是否用 VS Code 打开? (y/n): "
    if /i "!open_vscode!"=="y" (
        code %filepath%
    )
) else (
    echo.
    echo 错误: 文章创建失败！
    echo 请确保已安装 Hugo 并且在正确的目录下运行此脚本。
)

echo.
pause
