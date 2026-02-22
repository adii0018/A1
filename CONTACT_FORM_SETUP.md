# Contact Form Setup Guide

Contact form ab functional hai! Messages directly **singhrajputaditya982@gmail.com** pe jayenge.

## Setup Steps

### 1. Gmail App Password Generate Karo

1. Google Account pe jao: https://myaccount.google.com/
2. Security section mein jao
3. "2-Step Verification" enable karo (agar already nahi hai)
4. "App passwords" search karo
5. Naya app password generate karo:
   - App: Mail
   - Device: Other (Django Backend)
6. 16-digit password copy karo

### 2. Environment Variables Set Karo

`django_backend/.env` file mein add karo:

```env
# Email Configuration
EMAIL_HOST_USER=singhrajputaditya982@gmail.com
EMAIL_HOST_PASSWORD=your-16-digit-app-password-here
```

### 3. Backend Start Karo

```bash
cd django_backend
python manage.py runserver
```

### 4. Frontend Start Karo

```bash
npm run dev
```

## Testing

1. Landing page pe jao: http://localhost:5173
2. Scroll down to "Get in Touch" section
3. Form fill karo aur submit karo
4. Email check karo: singhrajputaditya982@gmail.com

## Features

✅ Form validation (all fields required)
✅ Loading state during submission
✅ Success/Error messages
✅ Email sent to: singhrajputaditya982@gmail.com
✅ Dark mode support
✅ Responsive design
✅ Animated UI

## Email Format

Aapko email iss format mein milega:

```
Subject: Contact Form: [User's Subject]

New Contact Form Submission

From: [User's Name]
Email: [User's Email]
Subject: [User's Subject]

Message:
[User's Message]

---
This email was sent from the Alice Proctor contact form.
```

## Troubleshooting

### Email nahi aa raha?

1. Check `.env` file - EMAIL_HOST_USER aur EMAIL_HOST_PASSWORD correct hai?
2. Gmail App Password use kar rahe ho (normal password nahi)?
3. Django backend running hai?
4. Console mein errors check karo
5. Gmail "Less secure app access" disabled hai (App Password use karo instead)

### CORS Error?

Django settings mein CORS already configured hai, but agar issue ho to check karo:
- `ALLOWED_HOSTS` mein localhost hai
- Frontend `http://localhost:8000` pe API call kar raha hai

## Production Deployment

Production mein deploy karte waqt:

1. Environment variables properly set karo
2. ALLOWED_HOSTS update karo
3. Email service provider consider karo (SendGrid, AWS SES, etc.)
4. Rate limiting add karo spam prevent karne ke liye

## Support

Koi issue ho to check karo:
- Django console logs
- Browser console
- Network tab (API calls)
