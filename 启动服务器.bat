@echo off
chcp 65001 >nul
title 测绘创新创业智能大赛训练系统

echo.
echo ╔══════════════════════════════════════════╗
echo ║  西南石油大学 - 测绘创新创业智能大赛训练系统  ║
echo ╚══════════════════════════════════════════╝
echo.
echo 正在启动本地 HTTP 服务器...

:: 尝试 Python 3
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo 使用 Python 启动服务器...
    echo.
    echo ➊ 浏览器将自动打开
    echo ➋ 关闭此窗口即可停止服务器
    echo ➌ 访问地址: http://localhost:8000
    echo.
    start http://localhost:8000
    python -m http.server 8000
    goto :end
)

:: 尝试 Python (无 python 命令时试用 python3)
python3 --version >nul 2>&1
if %errorlevel% equ 0 (
    echo 使用 Python3 启动服务器...
    start http://localhost:8000
    python3 -m http.server 8000
    goto :end
)

:: 都没有 Python
echo.
echo ╔══════════════════════════════════════════╗
echo ║  ❌ 未检测到 Python                       ║
echo ╠══════════════════════════════════════════╣
echo ║  请先安装 Python（推荐 3.7+）             ║
echo ║  下载地址: https://www.python.org/downloads/ ║
echo ║                                          ║
echo ║  安装时请勾选 "Add Python to PATH"        ║
echo ╚══════════════════════════════════════════╝
echo.
pause

:end
