# 🚀 Super Admin Panel - Quick Start Guide

## 1️⃣ Create Admin User (First Time Only)

```bash
cd django_backend
python create_admin_user.py
```

**Default Credentials:**
- Email: `admin@alice.com`
- Password: `admin123`
- Role: `admin`

## 2️⃣ Start the Application

### Terminal 1 - Backend
```bash
cd django_backend
python manage.py runserver
```
Backend runs on: `http://localhost:8000`

### Terminal 2 - Frontend
```bash
npm run dev
```
Frontend runs on: `http://localhost:5174`

## 3️⃣ Access Admin Panel

Open browser: `http://localhost:5174/admin`

Login with your admin credentials.

## 📋 Admin Panel Features

### Navigation Menu
- 📊 **Dashboard** - Overview & statistics
- 👥 **Users** - Manage all users
- 📝 **Exams** - Monitor & control exams
- 🏛️ **Institutions** - (Coming soon)
- 🛡️ **Proctoring Logs** - (Coming soon)
- ⚠️ **Violations** - Track violations
- ⚙️ **System Settings** - Configure system
- 📋 **Audit Logs** - View admin actions

### Dashboard Widgets
- Total Users count
- Active Exams (live)
- Institutions count
- Violations Today
- System Health Monitor
- Violation Trend Chart
- Exam Status Chart
- Live Activity Feed

### User Management
- View all users (students, teachers, admins)
- Search by name or email
- Filter by role (student/teacher/admin)
- Filter by status (active/inactive)
- Deactivate users
- Reset passwords
- Export to CSV

### Exam Management
- View all exams across platform
- Filter by status (live/completed/scheduled)
- Search by title or code
- Force stop live exams
- Lock exams
- View exam details
- Export data

### Violations
- View all violations
- Filter by:
  - Type (multiple-faces, no-face, gaze-away, tab-switch)
  - Severity (low, medium, high, critical)
  - Status (active, resolved, dismissed)
  - Date range
- Export to CSV

### System Settings
- **Violation Threshold**: Set violation limit (1-20)
- **Auto-Submit**: Enable/disable auto-submit on violations
- **AI Sensitivity**: Low, Medium, or High
- **Maintenance Mode**: Enable/disable system access
- **Session Timeout**: Set timeout in minutes

### Audit Logs
- View all admin actions
- Filter by action type
- Filter by admin
- Filter by date range
- Export logs
- Read-only (cannot be modified)

## 🎨 UI Features

### Dark Mode
Click the moon/sun icon in top navbar to toggle dark mode.

### Notifications
Click the bell icon to view system notifications.

### Search
Use the global search bar to find users or exams quickly.

### Profile Menu
Click your profile icon to access:
- Settings
- Logout

## 🔐 Security

### Confirmation Modals
All critical actions require confirmation:
- User deactivation
- Exam force stop
- System settings changes

### Audit Trail
All admin actions are automatically logged with:
- Timestamp
- Admin name
- Action type
- Target
- Details

## 📊 Charts & Analytics

### Violation Trend Chart
- 7-day line chart
- Shows violations by severity
- Color-coded: Low (yellow), Medium (orange), High (red), Critical (dark red)

### Exam Status Chart
- Pie chart showing distribution
- Live (green)
- Completed (blue)
- Scheduled (purple)
- Flagged (red)

## 📱 Responsive Design

### Desktop (> 1024px)
- Fixed sidebar navigation
- Multi-column layouts
- Full-width charts

### Tablet (768px - 1024px)
- Collapsible sidebar
- Responsive grids
- Touch-friendly

### Mobile (< 768px)
- Drawer navigation
- Single column layouts
- Bottom navigation

## 🔧 Troubleshooting

### Can't Login
- Verify user has `role: 'admin'` in MongoDB
- Check if MongoDB is running
- Clear browser cache and try again

### Dashboard Not Loading
- Check if backend is running on port 8000
- Check browser console for errors
- Verify JWT token in localStorage

### Charts Not Showing
- Recharts should be installed: `npm install recharts`
- Check browser console for errors
- Refresh the page

### API Errors
- Ensure backend is running
- Check CORS configuration in Django settings
- Verify API endpoints in `django_backend/api/urls.py`

## 📤 Export Features

### CSV Export Available For:
- User list
- Violations
- Audit logs
- Exam data

Click the "Export" button on respective pages.

## ⌨️ Keyboard Shortcuts

- `Ctrl/Cmd + K` - Focus search (coming soon)
- `Esc` - Close modals
- `Tab` - Navigate between elements

## 🎯 Quick Actions

### Deactivate User
1. Go to Users page
2. Find user
3. Click deactivate icon
4. Confirm action

### Force Stop Exam
1. Go to Exams page
2. Find live exam
3. Click "Stop" button
4. Confirm action

### Change Settings
1. Go to System Settings
2. Modify settings
3. Click "Save Changes"
4. Confirm action

## 📞 Need Help?

1. Check `SUPER_ADMIN_GUIDE.md` for detailed documentation
2. Review `ADMIN_PANEL_SUMMARY.md` for technical details
3. Check audit logs for recent actions
4. Contact system administrator

## 🎉 You're All Set!

Your Super Admin Panel is ready to use. Start monitoring and managing your Alice Exam Proctor platform!

---

**Pro Tip:** Keep the audit logs page open in a separate tab to monitor all admin activities in real-time.
