@echo off
setlocal enabledelayedexpansion

:: Abfrage des Datums
set "custom_date="
set /p "custom_date=Geben Sie ein Datum ein (YYYYMMDD) oder drücken Sie Enter für das aktuelle Datum: "
if not defined custom_date (
    for /f "tokens=2 delims==" %%A in ('"wmic os get localdatetime /value | findstr LocalDateTime"') do set datetime=%%A
    set "custom_date=!datetime:~0,8!"
)

:: Abfrage des Auftraggeber- und Projektnamens
set "client_name="
set "project_name="
set /p "client_name=Geben Sie den Auftraggebernamen ein: "
set /p "project_name=Geben Sie den Projektnamen ein: "

:: Leerzeichen und Sonderzeichen entfernen
for /f "delims=" %%A in ('echo %client_name% ^| powershell -Command "$input -replace '[^a-zA-Z0-9_]', ''"') do set "client_name=%%A"
for /f "delims=" %%A in ('echo %project_name% ^| powershell -Command "$input -replace '[^a-zA-Z0-9_]', ''"') do set "project_name=%%A"

:: Hauptordner erstellen
set "main_folder=%custom_date%_%client_name%_%project_name%"
mkdir "%main_folder%"

:: Unterordner erstellen
mkdir "%main_folder%\00_Final"
mkdir "%main_folder%\01_Footage\Cam_01"
mkdir "%main_folder%\01_Footage\Cam_02"
mkdir "%main_folder%\01_Footage\Cam_03"
mkdir "%main_folder%\01_Footage\Cam_04"
mkdir "%main_folder%\01_Footage\Liverecording"
mkdir "%main_folder%\01_Footage\SFX"
mkdir "%main_folder%\01_Footage\VFX"
mkdir "%main_folder%\01_Footage\Graphics"
mkdir "%main_folder%\01_Footage\Music"
mkdir "%main_folder%\02_Documents"

:: Erfolgsmeldung
echo Projektordner "%main_folder%" wurde erfolgreich erstellt.

pause

