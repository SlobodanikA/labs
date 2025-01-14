@echo off
setlocal enabledelayedexpansion

REM Checking command line parameters
if "%~1"=="" (
    echo "You did not specify the operation mode (1 or 2)"
    goto :help
)

REM Checking the operation mode
if /I "%~1" neq "1" if /I "%~1" neq "2" (
    echo Incorrect operation mode specified
    goto :help
)

REM Checking the directory if specified
if "%~1"=="2" (
    if "%~2"=="" (
        echo You did not specify the directory
        goto :help
    )

    if not exist "%~2" (
        echo Directory "%~2" not found
        goto :eof
    )
    set "target_directory=%~2"
) else (
    set "target_directory=%cd%"
)

REM Changing file attributes in the specified directory
echo Changing file attributes in directory: %target_directory%

REM Changing attributes for each file in the directory
for %%f in ("%target_directory%\*.*") do (
    attrib "%%f" | find "H" >nul && (
        attrib -h "%%f"
    ) || (
        attrib +h "%%f"
    )
)

if !errorlevel! neq 0 (
    echo Error occurred while changing file attributes
    goto :error
) else (
    echo File attributes changed successfully
    goto :eof
)

:error
exit /b 1

:help
echo Usage: %0 "[1 | 2] [path_to_directory]"
echo.
echo Parameters:
echo    1 - Work only with the current directory
echo    2 - Work with the specified directory
exit /b 0
