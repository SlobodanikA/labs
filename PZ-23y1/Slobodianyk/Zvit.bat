@echo off
start "" "LR3 Architect".docx
:перевірка
tasklist | find /i "WINWORD.EXE" >nul
if %errorlevel% equ 0 (
    timeout /t 5 /nobreak >nul
    goto перевірка
) else (
    exit
)
