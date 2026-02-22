@echo off
title Alice Exam Proctor - Stopping Servers
color 0C

echo.
echo ========================================
echo    ALICE EXAM PROCTOR
echo    Stopping All Servers...
echo ========================================
echo.

echo [1/2] Stopping Django Backend Server...
taskkill /FI "WindowTitle eq Django Backend - Alice Proctor*" /T /F >nul 2>&1
if %errorlevel% equ 0 (
    echo Backend server stopped successfully!
) else (
    echo No backend server found running.
)

echo.
echo [2/2] Stopping React Frontend Server...
taskkill /FI "WindowTitle eq React Frontend - Alice Proctor*" /T /F >nul 2>&1
if %errorlevel% equ 0 (
    echo Frontend server stopped successfully!
) else (
    echo No frontend server found running.
)

REM Also kill any node and python processes on ports 5173 and 8000
echo.
echo Cleaning up any remaining processes...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":5173" ^| find "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8000" ^| find "LISTENING"') do taskkill /F /PID %%a >nul 2>&1

echo.
echo ========================================
echo    ALL SERVERS STOPPED!
echo ========================================
echo.
pause
