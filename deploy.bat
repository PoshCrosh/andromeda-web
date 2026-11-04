@echo off
REM Double-click to publish the Andromeda site to Vercel (production).
cd /d "%~dp0"
echo.
echo  Publicando Andromeda en Vercel...
echo.
call vercel --prod
echo.
pause
