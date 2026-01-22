@echo off
chcp 65001 >nul

echo ========================================
echo    Hugo 博客一键发布工具
echo ========================================
echo.

:: 检查是否在 git 仓库中
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误: 当前目录不是 Git 仓库！
    echo 请先运行: git init
    pause
    exit /b 1
)

:: 显示当前状态
echo [1/4] 检查文件变更...
git status --short
echo.

:: 检查是否有变更
git diff --quiet --exit-code
set has_unstaged=%errorlevel%
git diff --quiet --exit-code --cached
set has_staged=%errorlevel%

if %has_unstaged% equ 0 if %has_staged% equ 0 (
    echo 没有检测到文件变更，无需发布。
    pause
    exit /b 0
)

:: 获取提交信息
echo.
set /p commit_msg="请输入提交信息 (直接回车使用默认信息): "
if "%commit_msg%"=="" (
    for /f "tokens=1-3 delims=/" %%a in ('date /t') do set today=%%a-%%b-%%c
    for /f "tokens=1-2 delims=:" %%a in ('time /t') do set now=%%a:%%b
    set commit_msg=更新博客内容 %today% %now%
)

:: 添加所有变更
echo.
echo [2/4] 添加文件到暂存区...
git add -A
if %errorlevel% neq 0 (
    echo 错误: git add 失败！
    pause
    exit /b 1
)

:: 提交变更
echo.
echo [3/4] 提交变更...
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo 错误: git commit 失败！
    pause
    exit /b 1
)

:: 推送到远程
echo.
echo [4/4] 推送到远程仓库...
git push
if %errorlevel% neq 0 (
    echo.
    echo 警告: git push 失败！
    echo 可能的原因:
    echo   1. 未设置远程仓库 (运行: git remote add origin 你的仓库地址)
    echo   2. 未设置上游分支 (运行: git push -u origin main)
    echo   3. 网络问题
    pause
    exit /b 1
)

echo.
echo ========================================
echo 发布成功！
echo ========================================
echo.
echo GitHub Actions 将自动构建并部署你的博客。
echo 请稍等几分钟后访问你的博客查看更新。
echo.
pause
