@echo off
setlocal enabledelayedexpansion

:: === Projektname aus .drp-Datei erkennen ===
for %%F in (*.drp) do (
    set "OLDNAME=%%~nF"
    goto :gotOldName
)

echo Keine .drp-Datei gefunden!
exit /b

:gotOldName
echo Alter Projektname erkannt: %OLDNAME%
set /p NEWNAME=Neuer Projektname: 

if "%OLDNAME%"=="%NEWNAME%" (
    echo Neuer Name ist gleich wie der alte. Abbruch.
    exit /b
)

:: === Alle passenden Dateien & Ordner umbenennen ===
for /r %%F in (*%OLDNAME%*) do (
    set "OLDPATH=%%~fF"
    set "NEWPATH=!OLDPATH:%OLDNAME%=%NEWNAME%!"
    if not "!OLDPATH!"=="!NEWPATH!" (
        echo Umbenennen: !OLDPATH! → !NEWPATH!
        ren "%%~fF" "%%~nxF" >nul 2>&1
        move "%%~fF" "!NEWPATH!" >nul 2>&1
    )
)

:: === drp-Datei umbenennen und Inhalte anpassen ===
set "OLDFILE=%OLDNAME%.drp"
set "NEWFILE=%NEWNAME%.drp"
rename "%OLDFILE%" "%NEWFILE%"

:: Inhalte ersetzen (PowerShell für In-Place-Ersetzung)
powershell -Command "(Get-Content -Raw -Encoding UTF8 '%NEWFILE%') -replace '%OLDNAME%', '%NEWNAME%' | Set-Content -Encoding UTF8 '%NEWFILE%'"

echo.
echo Umbenennung abgeschlossen: %OLDNAME% → %NEWNAME%
pause

