@echo off
set "PATH=C:\Program Files\nodejs;%APPDATA%\npm;%PATH%"
cd /d "%USERPROFILE%"
if not exist "%USERPROFILE%\.dsh" mkdir "%USERPROFILE%\.dsh" >nul 2>&1
if exist "%APPDATA%\npm\dsh.cmd" (
    call "%APPDATA%\npm\dsh.cmd" web > "%USERPROFILE%\.dsh\daemon.log" 2>&1
) else (
    call npx --yes @deepseek-ai/dsh web > "%USERPROFILE%\.dsh\daemon.log" 2>&1
)
