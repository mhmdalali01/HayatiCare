<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Flask-2.x-000000?logo=flask&logoColor=white" alt="Flask"/>
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Status-Active-2ecc71" alt="Status"/>
  <img src="https://img.shields.io/badge/License-MIT-yellow" alt="License"/>
</p>

<h1 align="center">🏥 HayatiCare</h1>
<p align="center"><strong>Modern Clinic & Hospital Management System</strong></p>
<p align="center">A full-stack healthcare management platform with a web dashboard for staff and a mobile app for patients.</p>

<p align="center">
  <code>Web Dashboard</code> •
  <code>Flutter Mobile App</code> •
  <code>Flask REST API</code> •
  <code>MySQL Database</code>
</p>

<br/>

---

## ✨ Features

| Icon | Feature | Description |
|------|---------|-------------|
| 🧑‍🤝‍🧑 | **Patient Management** | Register, view, and manage patient profiles and medical history |
| 🩺 | **Doctor Management** | Manage doctor profiles, specializations, and schedules |
| 📅 | **Appointment Booking** | Create, view, update, and cancel appointments with real-time status |
| 📊 | **Secretary Dashboard** | Central dashboard with today's schedule, workload, and quick actions |
| 📱 | **Mobile Doctor Browsing** | Browse and filter doctors by specialty directly from the mobile app |
| 🏷️ | **Category Filtering** | Filter doctors by Cardiology, Dermatology, Neurology, and more |
| 🔔 | **Notifications** | Real-time notifications for appointment updates and system events |
| 🎨 | **Clean Modern UI** | Premium gradient sidebar, animated transitions, and responsive design |

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Backend** | ![Flask](https://img.shields.io/badge/-Flask-000000?logo=flask) Python 3.10+ | REST API, authentication, business logic |
| **Database** | ![MySQL](https://img.shields.io/badge/-MySQL-4479A1?logo=mysql) 8.0+ | Data persistence with SQLAlchemy ORM |
| **Web Frontend** | ![HTML5](https://img.shields.io/badge/-HTML5-E34F26?logo=html5) ![CSS3](https://img.shields.io/badge/-CSS3-1572B6?logo=css3) ![JS](https://img.shields.io/badge/-JavaScript-F7DF1E?logo=javascript) | Secretary & doctor web dashboard |
| **Mobile App** | ![Flutter](https://img.shields.io/badge/-Flutter-02569B?logo=flutter) 3.x | Patient-facing Android app |
| **Auth** | ![JWT](https://img.shields.io/badge/-JWT-000000?logo=jsonwebtokens) | Token-based authentication with refresh |

### 📦 Key Dependencies

**Backend:** Flask, Flask-SQLAlchemy, Flask-JWT-Extended, Flask-Migrate, PyMySQL, bcrypt, Flask-CORS

**Mobile:** Dio (HTTP), Flutter Riverpod (state), Flutter Secure Storage, Google Fonts, Cached Network Image

---

## 📁 Project Structure

```
📦 HayatiCare/
├── 📂 backend/                  # Flask REST API
│   ├── 📂 app/
│   │   ├── 📂 models/          # SQLAlchemy ORM models
│   │   ├── 📂 routes/          # API route blueprints
│   │   ├── 📂 services/        # Business logic layer
│   │   ├── 📂 utils/           # Helpers & response wrappers
│   │   ├── __init__.py         # Flask app factory
│   │   └── extensions.py       # SQLAlchemy & JWT init
│   ├── 📂 migrations/          # Database schema files
│   ├── config.py               # App configuration
│   ├── run.py                  # Server entry point
│   ├── seed_data.py            # Sample data seeder
│   └── seed_admin.py           # Admin account seeder
│
├── 📂 flutter_app/             # Flutter mobile app
│   └── 📂 lib/
│       ├── 📂 core/            # Theme, constants, colors
│       ├── 📂 models/          # Dart data models
│       ├── 📂 providers/       # Riverpod state providers
│       ├── 📂 screens/         # UI screens (dashboard, appointments, etc.)
│       ├── 📂 services/        # API service layer
│       └── main.dart           # App entry point
│
├── 📂 web/                     # Web dashboard (static)
│   ├── 📂 css/                 # Stylesheets
│   ├── 📂 js/                  # Client-side JavaScript
│   ├── 📂 secretary/           # Secretary pages
│   ├── 📂 doctor/              # Doctor pages
│   └── index.html              # Login page
│
├── .env.example                # Environment template
├── requirements.txt            # Python dependencies
└── README.md                   # You are here
```

---

## 🚀 Getting Started

### 📋 Prerequisites

- ![Python](https://img.shields.io/badge/-Python_3.10+-3776AB?logo=python) installed
- ![MySQL](https://img.shields.io/badge/-MySQL_8.0+-4479A1?logo=mysql) installed and running
- ![Flutter](https://img.shields.io/badge/-Flutter_3.x-02569B?logo=flutter) SDK installed
- ![Git](https://img.shields.io/badge/-Git-F05032?logo=git) (optional, for cloning)

---

### 🖥️ Backend & Web Dashboard Setup

```bash
# 1. Navigate to the project root
cd HayatiCare

# 2. Create a Python virtual environment
python -m venv venv

# 3. Activate it
# Windows:
venv\Scripts\activate
# macOS / Linux:
source venv/bin/activate

# 4. Install Python dependencies
pip install -r requirements.txt

# 5. Configure environment
cp .env.example .env
# Edit .env with your MySQL credentials and secret keys
```

### 🗄️ Database Setup

```sql
-- Log into MySQL and run:
CREATE DATABASE hmss_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'hmss_user'@'localhost' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON hmss_db.* TO 'hmss_user'@'localhost';
FLUSH PRIVILEGES;
```

```bash
# Import the schema
mysql -u hmss_user -p hmss_db < backend/migrations/schema.sql

# Seed sample data (with venv activated)
cd backend
python seed_data.py
```

### ▶️ Run the Backend Server

```bash
cd backend
python run.py
```

The API and web dashboard will be available at **http://localhost:5000**.

**Default accounts (after seeding):**

| Role | Email | Password |
|------|-------|----------|
| 👩‍💼 Secretary | `secretary@hmss.com` | `Password123` |
| 🩺 Doctor | `dr.smith@hmss.com` | `Password123` |
| 🧑‍⚕️ Doctor | `dr.jones@hmss.com` | `Password123` |
| 🧑 Patient | `patient1@hmss.com` | `Password123` |

---

### 📱 Mobile App Setup

```bash
# 1. Navigate to the Flutter project
cd flutter_app

# 2. Install Flutter dependencies
flutter pub get

# 3. Update the API base URL
# Edit lib/core/constants.dart:
#    Change apiBaseUrl to your machine's LAN IP
#    For emulator: http://10.0.2.2:5000
#    For physical device: http://YOUR_IP:5000

# 4. Run the app
flutter run
```

---

## 🌐 API Overview

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/auth/login` | User login |
| `POST` | `/api/auth/register` | Patient registration |
| `GET` | `/api/doctors` | List all doctors |
| `GET` | `/api/doctors/available` | List active doctors |
| `GET` | `/api/patients/{id}/appointments` | Patient's appointments |
| `POST` | `/api/appointments` | Create appointment |
| `DELETE` | `/api/appointments/{id}` | Cancel appointment |
| `GET` | `/api/notifications` | User notifications |
| `GET` | `/api/secretaries/dashboard-summary` | Secretary dashboard data |

### Default URLs

| Service | URL |
|---------|-----|
| Backend API | `http://localhost:5000` |
| Web Dashboard | `http://localhost:5000` |
| Mobile App (emulator) | `http://10.0.2.2:5000` |

---

## 📸 Screenshots

> _Screenshots coming soon. Replace these placeholders with actual images._

<table>
  <tr>
    <td align="center">
      <img src="https://via.placeholder.com/400x250?text=Web+Dashboard" alt="Web Dashboard" width="400"/><br/>
      <em>Secretary Dashboard</em>
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/200x400?text=Mobile+App" alt="Mobile App" width="200"/><br/>
      <em>Patient Mobile App</em>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://via.placeholder.com/400x250?text=Appointments" alt="Appointments" width="400"/><br/>
      <em>Appointments Page</em>
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/400x250?text=Doctor+Management" alt="Doctors" width="400"/><br/>
      <em>Doctor Management</em>
    </td>
  </tr>
</table>

---

## ⚠️ Troubleshooting

| Issue | Solution |
|-------|----------|
| ❌ **Flask command not found** | Activate your virtual environment: `venv\Scripts\activate` |
| 🔌 **Port 5000 already in use** | Change port in `backend/run.py`, or run: <br/>`netstat -ano \| findstr :5000` then kill the process |
| 🔐 **Database access denied** | Verify `.env` credentials match your MySQL user |
| 🐬 **MySQL not running** | Start MySQL service: `net start MySQL80` (Windows) or `sudo service mysql start` (Linux) |
| 📦 **Flutter packages missing** | Run `flutter pub get` in the `flutter_app/` directory |
| 📱 **App can't reach backend** | Update `lib/core/constants.dart` with your machine's LAN IP instead of `localhost` |
| 🌐 **CORS errors in browser** | Ensure Flask-CORS is in `requirements.txt` and registered in `app/__init__.py` |
| 🔑 **JWT token invalid** | Keep consistent `JWT_SECRET_KEY` in `.env` across server restarts |

---

## 📌 Notes

- This project was developed for **academic and learning purposes** as part of a software engineering curriculum.
- Before deploying to production, update all **secret keys**, **database credentials**, and **CORS origins** in the `.env` file.
- The mobile app is currently configured for **local development**. For production, update the API base URL and enable HTTPS.
- The web dashboard uses session-based JWT tokens that expire after **15 minutes** by default (configurable in `.env`).

---

<p align="center">
  Made with ❤️ by the HayatiCare Team
  <br/>
  <sub>Hospital Management Software System — HMSS</sub>
</p>
