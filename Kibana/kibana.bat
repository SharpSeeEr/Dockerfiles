@echo off

SETLOCAL

set SCRIPT_DIR=%~dp0
echo Script Dir: %SCRIPT_DIR%
for %%I in ("%SCRIPT_DIR%..") do set DIR=%%~dpfI

echo DIR: %DIR%
set NODE=%DIR%\node\node.exe
echo NODE: %NODE%
echo NODE OPTIONS: %NODE_OPTIONS%

start "Kibana Server" /wait "%NODE%" %NODE_OPTIONS% --no-warnings "%DIR%\src\cli" %*

:finally

ENDLOCAL
