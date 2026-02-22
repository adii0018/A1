@echo off
title Alice Exam Proctor - Starting Servers
color 0A

echo.
echo ========================================
echo    ALICE EXAM PROCTOR
echo    Starting All Servers...
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if Python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed!
    echo Please install Python from https://www.python.org/
    pause
    exit /b 1
)

echo [1/4] Checking Frontend Dependencies...
if not exist "node_modules" (
    echo Installing frontend dependencies...
    call npm install
)

echo.
echo [2/4] Checking Backend Virtual Environment...
if not exist "django_backend\venv" (
    echo Creating virtual environment...
    cd django_backend
    python -m venv venv
    call venv\Scripts\activate
    pip install -r requirements.txt
    cd ..
)

echo.
echo [3/4] Starting Django Backend Server...
echo Backend will run on: http://localhost:8000
start "Django Backend - Alice Proctor" cmd /k "cd django_backend && venv\Scripts\activate && python manage.py runserver"

REM Wait for backend to start
timeout /t 3 /nobreak >nul

echo.
echo [4/4] Starting React Frontend Server...
echo Frontend will run on: http://localhost:5173
start "React Frontend - Alice Proctor" cmd /k "npm run dev"

echo.
echo ========================================
echo    SERVERS STARTED SUCCESSFULLY!
echo ========================================
echo.
echo Backend:  http://localhost:8000
echo Frontend: http://localhost:5173
echo.
echo Press any key to open the application in browser...
pause >nul

REM Open browser
start http://localhost:5173

echo.
echo ========================================
echo    APPLICATION IS RUNNING!
echo ========================================
echo.
echo To stop servers:
echo - Close the terminal windows
echo - Or press Ctrl+C in each window
echo.
echo This window can be closed safely.
echo.
pause
