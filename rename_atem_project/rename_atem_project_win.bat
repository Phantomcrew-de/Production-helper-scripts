@echo off
setlocal EnableDelayedExpansion

set "BASE_DIR=%cd%"

:: Find the first .drp file in this directory
for %%F in (*.drp) do (
    set "OLD_NAME=%%~nF"
    goto :found
)

echo ❌ No .drp file found in this directory.
exit /b 1

:found
echo 🔍 Found project: %OLD_NAME%.drp

:: Ask for new name
set /p NEW_NAME=🆕 Enter new project name: 

if "%NEW_NAME%"=="%OLD_NAME%" (
    echo ⚠️ New name is the same as the old name. Aborting.
    exit /b 1
)

:: Step 1: Rename files from deepest level upwards
for /f "delims=" %%F in ('dir /s /b /a-d ^| sort /R') do (
    set "OLD_PATH=%%F"
    set "NEW_PATH=!OLD_PATH:%OLD_NAME%=%NEW_NAME%!"
    if not "!OLD_PATH!"=="!NEW_PATH!" (
        ren "%%F" "!NEW_PATH:~,-1!"
    )
)

:: Step 2: Rename folders from top to bottom
for /f "delims=" %%D in ('dir /s /b /ad ^| sort') do (
    set "OLD_DIR=%%D"
    set "NEW_DIR=!OLD_DIR:%OLD_NAME%=%NEW_NAME%!"
    if not "!OLD_DIR!"=="!NEW_DIR!" (
        ren "%%D" "!NEW_DIR:~,-1!"
    )
)

:: Step 3: Rename the .drp file itself
if exist "%OLD_NAME%.drp" (
    ren "%OLD_NAME%.drp" "%NEW_NAME%.drp"
)

:: Step 4: Replace inside the .drp file (assuming it's plain text)
set "TMP_FILE=%TEMP%\__tmp_drp.txt"

(
    for /f "usebackq delims=" %%L in ("%NEW_NAME%.drp") do (
        set "LINE=%%L"
        setlocal EnableDelayedExpansion
        echo(!LINE:%OLD_NAME%=%NEW_NAME%!
        endlocal
    )
) > "%TMP_FILE%"

move /Y "%TMP_FILE%" "%NEW_NAME%.drp" >nul

echo ✅ Rename complete: %OLD_NAME% → %NEW_NAME%
pause
