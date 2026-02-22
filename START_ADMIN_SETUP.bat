@echo off
echo ========================================
echo   Alice Exam Proctor
echo   Super Admin Panel Setup
echo ========================================
echo.

echo [Step 1/3] Creating Super Admin User...
echo.
cd django_backend
python create_admin_user.py
echo.

echo [Step 2/3] Installing Frontend Dependencies...
echo.
cd ..
call npm install framer-motion lucide-react recharts
echo.

echo [Step 3/3] Setup Complete!
echo.
echo ========================================
echo   Next Steps:
echo ========================================
echo.
echo 1. Start Backend:
echo    cd django_backend
echo    python manage.py runserver
echo.
echo 2. Start Frontend (in new terminal):
echo    npm run dev
echo.
echo 3. Access Admin Panel:
echo    http://localhost:5174/admin
echo.
echo ========================================
pause
