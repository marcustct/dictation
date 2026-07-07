@echo off
REM ============================================
REM  Dictation Buddy - Local preview launcher
REM  Serves index.html so you can open it in a
REM  desktop browser, or test on an iPad on the
REM  same Wi-Fi via the LAN address shown below.
REM ============================================

echo ============================================
echo  Checking dependencies...
echo ============================================

python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Python is not installed.
    echo A local web server needs Python. Download it from:
    echo https://www.python.org/downloads/
    echo.
    echo (You can also just double-click index.html to open it
    echo  directly in a browser, but speech and some features
    echo  work best when served over http.)
    echo.
    pause
    exit /b 1
)

echo [OK] Python detected.
echo.
echo ============================================
echo  Starting local server on port 8080...
echo ============================================
echo.
echo  On this PC:      http://localhost:8080/
echo.
echo  On your iPad (same Wi-Fi): use this PC's IP,
echo  e.g. http://192.168.1.xxx:8080/
echo  (Run "ipconfig" in another window to find the IP.)
echo.
echo  Press Ctrl+C to stop the server.
echo ============================================
echo.

REM Open the page in the default browser, then serve.
start "" "http://localhost:8080/"
python -m http.server 8080
pause
