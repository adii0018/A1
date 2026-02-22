# 🛡️ Alice Exam Proctor - Super Admin Panel

## Overview

A production-ready, 2026-modern Super Admin Panel for system-level control, monitoring, and governance of the Alice Exam Proctor platform.

## 🎨 Design Philosophy

- **2026 Modern SaaS UI**: Clean, powerful, data-driven interface
- **Color Scheme**: White/off-white base with blue-purple AI accents
- **Minimal Glassmorphism**: Subtle backdrop blur effects
- **Dark Mode Ready**: Full dark mode support with smooth transitions
- **Calm Authority**: Professional yet approachable design

## 🚀 Features

### Dashboard
- **Real-time Statistics**: Total users, active exams, institutions, violations
- **System Health Monitor**: WebSocket, AI Service, Database, Storage status
- **Live Activity Feed**: Real-time updates on system events
- **Analytics Charts**: Violation trends and exam status distribution

### User Management
- View all users (students, teachers, admins)
- Filter by role and status
- Activate/deactivate users
- Reset passwords
- View user activity and violations
- Export user data

### Violations Management
- Central violation dashboard
- Filter by type, severity, status, date range
- Severity levels: Low, Medium, High, Critical
- Timeline view with detailed metadata
- Export violations to CSV

### Audit Logs
- Track all administrative actions
- Read-only permanent logs
- Filter by action type, admin, date
- Export audit trail
- Compliance-ready logging

### System Settings
- **Violation Thresholds**: Configure violation limits
- **Auto-Submit Rules**: Automatic exam submission on violations
- **AI Sensitivity**: Low, Medium, High detection levels
- **Maintenance Mode**: System-wide access control
- **Session Timeout**: Configure user session duration

## 📁 File Structure

```
src/
├── pages/admin/
│   ├── SuperAdminDashboard.jsx      # Main dashboard
│   ├── UsersManagement.jsx          # User management
│   ├── ViolationsManagement.jsx     # Violations dashboard
│   ├── AuditLogs.jsx                # Audit trail
│   └── SystemSettings.jsx           # System configuration
│
├── components/admin/
│   ├── AdminLayout.jsx              # Main layout wrapper
│   ├── AdminSidebar.jsx             # Collapsible sidebar
│   ├── AdminTopNavbar.jsx           # Top navigation bar
│   ├── StatCard.jsx                 # Statistics card component
│   ├── SystemHealthMonitor.jsx      # Health status widget
│   ├── ViolationChart.jsx           # Violations trend chart
│   ├── ExamStatusChart.jsx          # Exam distribution chart
│   ├── LiveActivityFeed.jsx         # Real-time activity feed
│   └── ConfirmModal.jsx             # Confirmation dialog
│
django_backend/api/views/
└── admin_api.py                     # Admin API endpoints
```

## 🔐 Access Control

### Role-Based Access
- Only users with `role: 'admin'` can access admin panel
- Protected routes with `ProtectedRoute` component
- JWT authentication required for all API calls

### Creating Admin User

```python
# In Django shell or create_admin.py
from api.models import User
import bcrypt

password_hash = bcrypt.hashpw('admin_password'.encode('utf-8'), bcrypt.gensalt())
User.create(
    name='Super Admin',
    email='admin@alice.com',
    password_hash=password_hash.decode('utf-8'),
    role='admin'
)
```

## 🛠️ Installation & Setup

### 1. Install Dependencies

```bash
# Frontend
npm install framer-motion lucide-react recharts

# Backend (already included)
pip install -r requirements.txt
```

### 2. Start the Application

```bash
# Backend
cd django_backend
python manage.py runserver

# Frontend
npm run dev
```

### 3. Access Admin Panel

Navigate to: `http://localhost:5174/admin`

Login with admin credentials.

## 📊 API Endpoints

### Dashboard
- `GET /api/admin/dashboard-stats/` - Get dashboard statistics

### Users
- `GET /api/admin/users/` - List all users
- `POST /api/admin/users/<user_id>/<action>/` - Perform user action
  - Actions: `deactivate`, `activate`, `reset-password`

### Violations
- `GET /api/admin/violations/` - List all violations with enriched data

### Audit Logs
- `GET /api/admin/audit-logs/` - Get audit trail

### System Settings
- `GET /api/admin/settings/` - Get current settings
- `POST /api/admin/settings/` - Update settings

### Exams
- `GET /api/admin/exams/` - List all exams
- `POST /api/admin/exams/<exam_id>/<action>/` - Perform exam action
  - Actions: `force-stop`, `lock`

## 🎯 Key Components

### AdminLayout
Responsive layout with collapsible sidebar and top navbar.

```jsx
<AdminLayout>
  {/* Your admin page content */}
</AdminLayout>
```

### StatCard
Animated statistics card with trend indicators.

```jsx
<StatCard
  title="Total Users"
  value={1234}
  change="+12%"
  trend="up"
  icon="👥"
  color="blue"
/>
```

### ConfirmModal
Confirmation dialog for critical actions.

```jsx
<ConfirmModal
  title="Confirm Action"
  message="Are you sure?"
  onConfirm={handleConfirm}
  onCancel={handleCancel}
  type="danger"
/>
```

## 🔔 Real-time Features

### WebSocket Integration
- Live activity feed updates
- Real-time violation notifications
- System health monitoring

### Usage
```jsx
const { isConnected } = useWebSocket('admin-dashboard');
```

## 📱 Responsive Design

### Desktop (lg+)
- Fixed sidebar (collapsible)
- Full-width content area
- Multi-column layouts

### Tablet (md)
- Drawer navigation
- Responsive grids
- Touch-friendly controls

### Mobile (sm)
- Bottom navigation
- Single column layouts
- Optimized touch targets

## 🎨 Theming

### Dark Mode
Automatic dark mode support using ThemeContext.

```jsx
const { theme, toggleTheme } = useTheme();
```

### Color Palette
- **Primary**: Blue (#3B82F6) to Purple (#8B5CF6) gradient
- **Success**: Green (#10B981)
- **Warning**: Yellow (#EAB308) to Orange (#F97316)
- **Danger**: Red (#EF4444)
- **Neutral**: Gray scale

## 🔒 Security Features

### Confirmation Modals
All destructive actions require confirmation:
- User deactivation
- Exam force stop
- Settings changes

### Audit Trail
All admin actions are logged:
- Timestamp
- Admin ID
- Action type
- Target
- Details

### Read-Only Logs
Audit logs cannot be modified or deleted.

## 📈 Analytics & Charts

### Violation Trend Chart
7-day trend line chart showing violations by severity.

### Exam Status Distribution
Pie chart showing exam status breakdown:
- Live
- Completed
- Scheduled
- Flagged

## 🚦 System Health Monitoring

Real-time monitoring of:
- **WebSocket**: Connection status
- **AI Service**: Operational status
- **Database**: Health check
- **Storage**: Capacity status

## 📤 Export Features

### CSV Export
- User list export
- Violations export
- Audit logs export

### Format
```csv
Timestamp,User,Action,Details
2026-02-22 10:30:00,admin@alice.com,user_ban,Banned for violations
```

## 🎯 Best Practices

### 1. Always Confirm Critical Actions
Use ConfirmModal for destructive operations.

### 2. Log All Admin Actions
Ensure audit trail for compliance.

### 3. Use Role-Based Access
Check user role before rendering admin features.

### 4. Handle Errors Gracefully
Show user-friendly error messages.

### 5. Optimize Performance
- Lazy load components
- Paginate large lists
- Cache API responses

## 🐛 Troubleshooting

### Admin Panel Not Loading
- Check if user has `role: 'admin'`
- Verify JWT token is valid
- Check browser console for errors

### API Errors
- Ensure backend is running
- Check CORS configuration
- Verify API endpoints in urls.py

### Charts Not Rendering
- Install recharts: `npm install recharts`
- Check data format matches chart requirements

## 🔄 Future Enhancements

- [ ] Institution management
- [ ] Bulk user operations
- [ ] Advanced analytics dashboard
- [ ] Email notification system
- [ ] Webhook integrations
- [ ] Custom report builder
- [ ] Role permissions editor
- [ ] System backup/restore

## 📞 Support

For issues or questions:
- Check documentation
- Review audit logs
- Contact system administrator

## 📄 License

Part of Alice Exam Proctor platform.

---

**Built with ❤️ for 2026 modern SaaS standards**
