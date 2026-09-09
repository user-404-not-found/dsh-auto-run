@echo off
chcp 65001 >nul
echo 正在設定 DeepSeek Harness 開機自啟與桌面捷徑...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ws = New-Object -ComObject WScript.Shell; " ^
  "$dir = (Get-Location).Path; " ^
  "$startup = [System.Environment]::GetFolderPath('Startup'); " ^
  "$desktop = [System.Environment]::GetFolderPath('Desktop'); " ^
  "$s1 = $ws.CreateShortcut(\"$startup\Start_DSH_Background.lnk\"); " ^
  "$s1.TargetPath = 'wscript.exe'; " ^
  "$s1.Arguments = \"`\"$dir\start_dsh_background.vbs`\"\"; " ^
  "$s1.WorkingDirectory = $dir; " ^
  "$s1.Save(); " ^
  "$s2 = $ws.CreateShortcut(\"$desktop\DeepSeek Harness.lnk\"); " ^
  "$s2.TargetPath = 'wscript.exe'; " ^
  "$s2.Arguments = \"`\"$dir\open_dsh.vbs`\"\"; " ^
  "$s2.WorkingDirectory = $dir; " ^
  "if (Test-Path \"$dir\fr031-ta292-001.ico\") { $s2.IconLocation = \"$dir\fr031-ta292-001.ico\" } " ^
  "elseif (Test-Path 'C:\Program Files\Google\Chrome\Application\chrome.exe') { $s2.IconLocation = 'C:\Program Files\Google\Chrome\Application\chrome.exe, 0' } " ^
  "elseif (Test-Path 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe') { $s2.IconLocation = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe, 0' }; " ^
  "$s2.Save(); " ^
  "Write-Host '捷徑建立成功！' -ForegroundColor Green"

echo.
echo ========================================================
echo  設定完成！
echo  1. [開機自啟] 已加入 Windows 開機啟動清單。
echo  2. [桌面圖示] 桌面已建立「DeepSeek Harness」捷徑。
echo ========================================================
echo.
pause