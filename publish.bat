@echo off
rem Pousse toutes les videos ajoutees dans ce dossier, puis liste les liens directs.
rem Usage : double-clic, ou dans le terminal : .\publish.bat
setlocal
cd /d "%~dp0"

echo Envoi vers GitHub...
git add -A
git commit -m "maj videos"
git pull --rebase
git push
if errorlevel 1 (
  echo.
  echo *** Le push a echoue. Lance "git status" pour voir pourquoi. ***
  echo.
  pause
  exit /b 1
)

echo.
echo === Liens a copier ^(actifs ~1-2 min apres^) ===
for /f "delims=" %%f in ('git ls-files "*.mp4"') do echo https://mohammedelkhalfy-dot.github.io/ad-test-assets/%%f
echo.
pause
