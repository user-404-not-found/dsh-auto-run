@echo off
set "PATH=C:\Program Files\nodejs;%APPDATA%\npm;%PATH%"
cd /d "%USERPROFILE%"
if exist "%APPDATA%\npm\dsh.cmd" (
    "%APPDATA%\npm\dsh.cmd" web
) else (
    npx --yes @deepseek-ai/dsh web
)
