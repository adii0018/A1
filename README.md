# 🤖 Alice Exam Proctor - AI-Powered Online Proctoring System

A modern, clean, and efficient exam proctoring platform with real-time AI monitoring, violation detection, and a beautiful responsive UI. Built with React and Django for seamless online examination experiences.

## 🚀 DEPLOYMENT READY!

**Quick Start:** See [DEPLOY_QUICK_START.md](DEPLOY_QUICK_START.md) for 30-minute deployment guide  
**Full Checklist:** See [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md) for comprehensive deployment guide

### Recent Updates for Production:
- ✅ Environment variables configured for frontend & backend
- ✅ Dynamic API and WebSocket URLs
- ✅ Production security settings enabled
- ✅ CORS properly configured
- ✅ Deployment configs added (Vercel, Railway, Render)
- ✅ Static files configuration ready

## ✨ Features

### 🎯 Core Features
- **Role-based Authentication** - Separate portals for Students and Teachers
- **AI-Powered Proctoring** - Real-time face detection and audio monitoring
- **Multi-Face Detection** - Detects multiple people in webcam feed (NEW!)
- **Real-time Violation Alerts** - Instant teacher notifications via WebSocket (NEW!)
- **Alice AI Assistant** - Built-in AI chatbot for instant help and support
- **Quiz Management** - Create, manage, and conduct online exams
- **Violation Detection** - Automatic flagging of suspicious behavior
- **Real-time Monitoring** - WebSocket-based live updates
- **Clean Modern UI** - Simple, fast, and professional design

### 🎨 UI/UX Features
- **Clean Design** - Modern, minimalist interface
- **Fast Performance** - Optimized for speed and efficiency
- **Responsive Design** - Works perfectly on all devices
- **Smooth Transitions** - Subtle animations for better UX
- **Professional Theme** - Clean white/blue color scheme
- **Accessibility** - WCAG compliant design

### 🔒 Proctoring Features (NEW!)
- **Browser-based Face Detection** - Uses face-api.js for client-side detection
- **Configurable Thresholds** - Adjust detection sensitivity and timing
- **Calm Student Warnings** - Non-intrusive amber alerts
- **Teacher Real-time Alerts** - Toast notifications with sound
- **Violation Logging** - Complete audit trail in MongoDB
- **Privacy-focused** - No video upload, only metadata
- **Debounce Logic** - Prevents false positives

## 🛠️ Tech Stack

### Frontend
- **React 18.2** - UI library
- **Vite 5.x** - Build tool & dev server
- **Tailwind CSS 3.4** - Utility-first CSS framework
- **React Router 6** - Client-side routing
- **Axios** - HTTP client for API calls
- **React Hot Toast** - Toast notifications

### Backend
- **Django 4.2.7** - Web framework
- **Django REST Framework** - API
- **Django Channels** - WebSocket support
- **Daphne** - ASGI server
- **Redis** - Channel layer for WebSocket
- **MongoDB** - Database
- **PyMongo** - MongoDB driver
- **JWT** - Authentication
- **Bcrypt** - Password hashing

### AI & Detection
- **OpenCV.js** - High accuracy face detection (primary)
- **face-api.js** - Lightweight fallback option
- **Auto Engine Selection** - Automatic best engine selection
- **Haar Cascade** - Industry-standard face detection
- **TinyFaceDetector** - Fast ML model
- **WebRTC** - Camera access
- **WebSocket** - Real-time communication

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Python 3.10+
- MongoDB 6.0+
- Redis 6.0+ (for WebSocket support)

### Backend Setup
```bash
cd django_backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
copy .env.example .env
python init_database.py
python create_sample_data.py

# Start Redis (required for WebSocket)
redis-server

# Start Django with Daphne (ASGI server for WebSocket)
daphne -b 0.0.0.0 -p 8000 exam_proctoring.asgi:application
```

### Frontend Setup
```bash
npm install
npm run dev
```

### Test Face Detection
Open `TEST_FACE_DETECTION.html` in your browser to test face-api.js detection.  
Open `TEST_OPENCV_DETECTION.html` in your browser to test OpenCV.js detection.

## 📚 Documentation

- **[Feature Summary](FEATURE_SUMMARY.md)** - Overview of multi-face detection feature
- **[Setup Guide](SETUP_FACE_DETECTION.md)** - Quick setup instructions
- **[Implementation Details](MULTI_FACE_DETECTION_IMPLEMENTATION.md)** - Complete technical documentation
- **[Flow Diagrams](FLOW_DIAGRAM.md)** - Visual system architecture
- **[OpenCV vs face-api.js](OPENCV_VS_FACEAPI.md)** - Engine comparison guide (NEW!)

## 🎮 Demo Credentials

### Students
- **Email:** student1@example.com
- **Password:** password123

### Teachers
- **Email:** teacher1@example.com
- **Password:** password123

## 👥 Authors
**Alice Exam Proctor Team**
- Developed by: **Aditya Singh Rajput**

## 📞 Support
For issues or questions:
- Email: opg21139@gmail.com

---
Made with ❤️ and modern web technologies by **Alice Team**
