# 🏗️ Super Admin Panel - Architecture Overview

## System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        SUPER ADMIN PANEL                         │
│                     (React 18 + Vite + Tailwind)                │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 │ HTTP/REST + WebSocket
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                      DJANGO REST BACKEND                         │
│                    (Python + Django + Channels)                  │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 │ MongoDB Driver
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                         MONGODB DATABASE                         │
│              (users, quizzes, violations, flags)                 │
└─────────────────────────────────────────────────────────────────┘
```

## Component Hierarchy

```
App.jsx
│
├── ThemeProvider (Dark Mode)
│   └── AuthProvider (Authentication)
│       └── Router
│           └── ProtectedRoute (role="admin")
│               └── AdminLayout
│                   ├── AdminSidebar
│                   │   └── Navigation Links
│                   │
│                   ├── AdminTopNavbar
│                   │   ├── Global Search
│                   │   ├── Notifications
│                   │   ├── Dark Mode Toggle
│                   │   └── Profile Menu
│                   │
│                   └── Page Content
│                       ├── SuperAdminDashboard
│                       │   ├── StatCard (x6)
│                       │   ├── SystemHealthMonitor
│                       │   ├── ViolationChart
│                       │   ├── ExamStatusChart
│                       │   └── LiveActivityFeed
│                       │
│                       ├── UsersManagement
│                       │   ├── Search & Filters
│                       │   ├── Users Table
│                       │   └── ConfirmModal
│                       │
│                       ├── ExamsManagement
│                       │   ├── Stats Cards
│                       │   ├── Search & Filters
│                       │   ├── Exams Grid
│                       │   └── ConfirmModal
│                       │
│                       ├── ViolationsManagement
│                       │   ├── Stats Cards
│                       │   ├── Filters
│                       │   └── Violations List
│                       │
│                       ├── AuditLogs
│                       │   ├── Filters
│                       │   └── Timeline View
│                       │
│                       └── SystemSettings
│                           ├── Violation Settings
│                           ├── AI Settings
│                           ├── System Config
│                           └── ConfirmModal
```

## Data Flow

### 1. Authentication Flow
```
User Login
    │
    ├─► POST /api/auth/login/
    │       │
    │       ├─► Verify credentials (MongoDB)
    │       │
    │       └─► Return JWT token + user data
    │
    └─► Store token in localStorage
            │
            └─► Redirect to /admin (if role === 'admin')
```

### 2. Dashboard Data Flow
```
Dashboard Mount
    │
    ├─► GET /api/admin/dashboard-stats/
    │       │
    │       ├─► Count users (MongoDB)
    │       ├─► Count active exams
    │       ├─► Count violations today
    │       │
    │       └─► Return aggregated stats
    │
    ├─► WebSocket connection
    │       │
    │       └─► Real-time updates
    │
    └─► Render components with data
```

### 3. User Management Flow
```
Users Page
    │
    ├─► GET /api/admin/users/
    │       │
    │       ├─► Fetch all users (MongoDB)
    │       ├─► Remove password field
    │       │
    │       └─► Return users array
    │
    ├─► User Action (deactivate/reset)
    │       │
    │       ├─► Show ConfirmModal
    │       │
    │       ├─► POST /api/admin/users/<id>/<action>/
    │       │       │
    │       │       ├─► Update user status
    │       │       ├─► Log action (audit)
    │       │       │
    │       │       └─► Return success
    │       │
    │       └─► Refresh user list
    │
    └─► Export CSV
            │
            └─► Generate CSV from filtered data
```

### 4. Violations Flow
```
Violations Page
    │
    ├─► GET /api/admin/violations/
    │       │
    │       ├─► Fetch violations (MongoDB)
    │       ├─► Enrich with user names
    │       ├─► Enrich with exam titles
    │       │
    │       └─► Return enriched violations
    │
    ├─► Apply Filters
    │       │
    │       ├─► Filter by type
    │       ├─► Filter by severity
    │       ├─► Filter by status
    │       │
    │       └─► Update display
    │
    └─► Export CSV
            │
            └─► Generate CSV from filtered data
```

### 5. Settings Update Flow
```
Settings Page
    │
    ├─► GET /api/admin/settings/
    │       │
    │       └─► Return current settings
    │
    ├─► User modifies settings
    │       │
    │       └─► Set pendingChanges = true
    │
    ├─► Click "Save Changes"
    │       │
    │       ├─► Show ConfirmModal
    │       │
    │       ├─► POST /api/admin/settings/
    │       │       │
    │       │       ├─► Validate settings
    │       │       ├─► Update database
    │       │       ├─► Log action (audit)
    │       │       │
    │       │       └─► Return success
    │       │
    │       └─► Set pendingChanges = false
    │
    └─► Settings applied system-wide
```

## API Endpoints Map

```
/api/admin/
│
├── dashboard-stats/          [GET]
│   └─► Returns: { totalUsers, activeExams, institutions, violationsToday, ... }
│
├── users/                    [GET]
│   └─► Returns: { users: [...] }
│
├── users/<id>/<action>/      [POST]
│   ├─► Actions: deactivate, activate, reset-password
│   └─► Returns: { success: true }
│
├── exams/                    [GET]
│   └─► Returns: { exams: [...] }
│
├── exams/<id>/<action>/      [POST]
│   ├─► Actions: force-stop, lock
│   └─► Returns: { success: true }
│
├── violations/               [GET]
│   └─► Returns: { violations: [...] }
│
├── audit-logs/               [GET]
│   └─► Returns: { logs: [...] }
│
└── settings/                 [GET, POST]
    ├─► GET: Returns current settings
    └─► POST: Updates settings
```

## State Management

```
Component State (useState)
    │
    ├─► Local UI state
    │   ├─► Modal visibility
    │   ├─► Filter values
    │   ├─► Search queries
    │   └─► Loading states
    │
    ├─► Data state
    │   ├─► Users list
    │   ├─► Exams list
    │   ├─► Violations list
    │   └─► Statistics
    │
    └─► Derived state (useEffect)
        ├─► Filtered data
        ├─► Sorted data
        └─► Computed values

Context State
    │
    ├─► ThemeContext
    │   ├─► theme (light/dark)
    │   └─► toggleTheme()
    │
    └─► AuthContext
        ├─► user
        ├─► token
        ├─► login()
        └─► logout()

LocalStorage
    │
    ├─► JWT token
    ├─► Theme preference
    └─► User data
```

## Security Layers

```
┌─────────────────────────────────────────┐
│  Layer 1: Route Protection              │
│  ProtectedRoute checks role === 'admin' │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│  Layer 2: JWT Authentication            │
│  Token sent with every API request      │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│  Layer 3: Backend Authorization         │
│  Django verifies token & permissions    │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│  Layer 4: Confirmation Modals           │
│  User confirms critical actions         │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│  Layer 5: Audit Logging                 │
│  All actions logged permanently         │
└─────────────────────────────────────────┘
```

## Responsive Breakpoints

```
Mobile (< 768px)
    │
    ├─► Drawer navigation
    ├─► Single column layouts
    ├─► Stacked cards
    └─► Bottom navigation

Tablet (768px - 1024px)
    │
    ├─► Collapsible sidebar
    ├─► 2-column grids
    ├─► Responsive tables
    └─► Touch-optimized

Desktop (> 1024px)
    │
    ├─► Fixed sidebar
    ├─► Multi-column grids
    ├─► Full-width tables
    └─► Hover interactions
```

## Performance Optimizations

```
Frontend
    │
    ├─► Lazy loading components
    ├─► Debounced search inputs
    ├─► Memoized calculations
    ├─► Optimized re-renders
    └─► Code splitting

Backend
    │
    ├─► Database indexing
    ├─► Query optimization
    ├─► Response caching
    ├─► Pagination
    └─► Async operations

Network
    │
    ├─► Request batching
    ├─► Response compression
    ├─► WebSocket for real-time
    └─► CDN for static assets
```

## Technology Stack

```
Frontend
    ├─► React 18 (UI library)
    ├─► Vite (Build tool)
    ├─► Tailwind CSS (Styling)
    ├─► Framer Motion (Animations)
    ├─► Lucide React (Icons)
    ├─► Recharts (Charts)
    └─► React Router (Routing)

Backend
    ├─► Django 4.2 (Framework)
    ├─► Django REST Framework (API)
    ├─► Django Channels (WebSocket)
    ├─► PyMongo (MongoDB driver)
    └─► bcrypt (Password hashing)

Database
    └─► MongoDB (NoSQL database)

Infrastructure
    ├─► Redis (WebSocket layer)
    └─► Nginx (Reverse proxy - production)
```

## Deployment Architecture

```
Production Setup
    │
    ├─► Frontend (Vercel/Netlify)
    │   ├─► Static files served via CDN
    │   └─► Environment variables
    │
    ├─► Backend (Heroku/AWS/DigitalOcean)
    │   ├─► Django application
    │   ├─► Gunicorn/Daphne server
    │   └─► Environment variables
    │
    ├─► Database (MongoDB Atlas)
    │   ├─► Managed MongoDB cluster
    │   └─► Automatic backups
    │
    └─► Redis (Redis Cloud)
        └─► WebSocket channel layer
```

## Monitoring & Logging

```
Application Logs
    │
    ├─► Django logs (backend.log)
    ├─► Error tracking (Sentry)
    └─► Performance monitoring

Audit Logs
    │
    ├─► Admin actions
    ├─► User changes
    ├─► System changes
    └─► Security events

System Health
    │
    ├─► WebSocket status
    ├─► AI service status
    ├─► Database health
    └─► Storage capacity
```

---

**This architecture ensures scalability, security, and maintainability for the Super Admin Panel.**
