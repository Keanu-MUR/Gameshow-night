@echo off
rem The Chihuahua Cup - opens the game in its own window. No internet needed.
setlocal EnableDelayedExpansion
set "HERE=%~dp0"
set "PAGE=%HERE%chihuahua-cup.html"
if not exist "%PAGE%" goto missing
set "URL=file:///%PAGE:\=/%"
set "URL=!URL: =%%20!"
set "KEY=SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths"
for %%B in (msedge chrome brave) do call :try %%B
rem No Edge, Chrome or Brave found: open in whatever browser is the default.
start "" "%PAGE%"
exit /b 0

:try
reg query "HKLM\%KEY%\%1.exe" >/dev/null 2>&1 || reg query "HKCU\%KEY%\%1.exe" >/dev/null 2>&1 || exit /b 1
start "" %1 --user-data-dir="%HERE%data" --no-first-run --no-default-browser-check --start-maximized --app="%URL%"
exit

:missing
echo chihuahua-cup.html is missing. Keep this launcher in the same folder as the game file.
pause
exit /b 1
