@echo off
chcp 65001 > nul
cls
echo Microsoft Windows [版本 10.0.14393]
echo (c) 2016 Microsoft Corporation. 著作權所有，並保留一切權利。
echo.
echo 命令提示字元已經被您的系統管理員停用了。
echo.

timeout /t 1 /nobreak > nul

:: 取得 ANSI Escape 字符 (ESC)
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: 倒數迴圈：每次列印前先用 ESC[1G 移回行首，ESC[0K 清除該行
for /l %%i in (5,-1,1) do (
    <nul set /p "=%ESC%[1G%ESC%[0K將在 %%i 秒後關閉 cmd.exe ..."
    timeout /t 1 /nobreak > nul
)

exit