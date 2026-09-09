@echo off
chcp 65001 >nul
echo 正在移除 DeepSeek Harness 開機自啟與桌面捷徑...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$startup = [System.Environment]::GetFolderPath('Startup'); " ^
  "$desktop = [System.Environment]::GetFolderPath('Desktop'); " ^
  "$s1 = \"$startup\Start_DSH_Background.lnk\"; " ^
  "$s2 = \"$desktop\DeepSeek Harness.lnk\"; " ^
  "if (Test-Path $s1) { Remove-Item $s1 -Force; Write-Host '已移除開機自啟捷徑' -ForegroundColor Yellow }; " ^
  "if (Test-Path $s2) { Remove-Item $s2 -Force; Write-Host '已移除桌面捷徑' -ForegroundColor Yellow }; " ^
  "Write-Host '捷徑清理完成！' -ForegroundColor Green"

echo.
echo ========================================================
echo  已移除開機啟動項與桌面圖示。
echo  若背景服務正在執行，可執行 stop_dsh.vbs 停止。
echo ========================================================
echo.
pause