<p align="center">
  <img src="https://img.shields.io/badge/Flask-3.x-000000?logo=flask&logoColor=white" alt="Flask"/>
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/JavaScript-ES6-F7DF1E?logo=javascript&logoColor=black" alt="JavaScript"/>
  <img src="https://img.shields.io/badge/JWT-Auth-000000?logo=jsonwebtokens&logoColor=white" alt="JWT"/>
  <img src="https://img.shields.io/badge/Status-Active-2ecc71" alt="Status"/>
</p>

<h1 align="center">🏥 Hospital Management Software System</h1>
<p align="center"><strong>A secure, role-based clinic management platform</strong></p>
<p align="center">
  Centralized digital solution for managing appointments, medical test results,<br/>
  and doctor–patient communication — built for real clinical environments.
</p>

<p align="center">
  <code>Flask REST API</code> •
  <code>MySQL Database</code> •
  <code>Vanilla JS Web Dashboard</code> •
  <code>Flutter Mobile App</code>
</p>

---

## 👥 Team

| Name | Role |
|------|------|
| Mohamad Al Ali | 
| Mohammad Sinn  | 
| Ahmad Ghaddar  | 
| Omar Saadeh    | 

> 📚 Lebanese American University — COE461 Software Engineering (Spring 2026)

---

## ✨ Features

| | Feature | Description |
|--|---------|-------------|
| 🔐 | **Role-Based Access Control** | Patients, Doctors, and Secretaries each get a tailored interface with scoped permissions |
| 📅 | **Appointment Management** | Full workflow: request → confirm / reschedule → notify, managed by doctors and secretaries |
| 🧪 | **Medical Test Results** | Doctors upload results; the system auto-flags values outside normal ranges |
| 🚨 | **Abnormal Value Detection** | Out-of-range results are highlighted immediately for both patient and doctor |
| 🤖 | **Medical Chatbot** | Restricted chatbot that answers questions about the app and reference ranges — no diagnoses |
| 🔔 | **Notifications** | Automated alerts for appointment updates and test result availability |
| 🔒 | **Account Lockout** | Accounts lock temporarily after 3 consecutive failed login attempts |
| 🏠 | **Home Test Submissions** | Patients submit home measurements via the mobile app for doctor review |
| 👩‍💼 | **Secretary Dashboard** | Full visibility over all appointments, patient accounts, and doctor accounts |
| 📱 | **Patient Mobile App** | Flutter app: appointments, test results, chatbot, and notifications |

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Backend** | Python 3 + Flask | REST API, business logic, authentication |
| **ORM** | Flask-SQLAlchemy | Database modeling and query abstraction |
| **Auth** | Flask-JWT-Extended + bcrypt | Token-based auth with secure password hashing |
| **Database** | MySQL 8.0 | Persistent relational data storage |
| **Web Frontend** | HTML + CSS + Vanilla JavaScript | Secretary and Doctor web dashboard |
| **Mobile App** | Flutter (Dart) | Patient-facing mobile application |
| **Cross-origin** | Flask-CORS | Enables the web dashboard to communicate with the backend |

### 📦 Key Backend Dependencies

```
Flask
Flask-SQLAlchemy
Flask-JWT-Extended
Flask-CORS
Flask-Migrate
PyMySQL
bcrypt
```

---

## 👤 User Roles

### 🧑 Patient — Mobile App (Flutter)
- Log in with credentials created by the secretary
- Request new appointments with available doctors
- View upcoming and past appointments
- View medical test results (abnormal values are visually flagged)
- Submit home test measurements for doctor review
- Use the restricted medical information chatbot
- Receive notifications for appointment and result updates

### 👩‍💼 Secretary — Web Dashboard
- Create and delete patient and doctor accounts
- Schedule, reschedule, and cancel appointments
- View all appointments across all doctors
- Send notifications to patients and doctors

### 🩺 Doctor — Web Dashboard
- View all assigned appointments and associated patient details
- Confirm or reschedule appointment requests
- Upload test results (auto-flagged if outside normal range)
- View full medical history of assigned patients
- Review home test measurements submitted by patients
- View a summary of all flagged abnormal results
- Send notifications to patients

---

## 📁 Project Structure

```
📦 HMSS/
├── 📂 backend/                     # Flask REST API
│   ├── 📂 app/
│   │   ├── 📂 models/              # SQLAlchemy ORM models
│   │   ├── 📂 routes/              # API blueprints (auth, patients, doctors, appointments…)
│   │   ├── 📂 services/            # Business logic layer
│   │   └── 📂 utils/               # Helpers and response wrappers
│   ├── config.py                   # App configuration
│   ├── run.py                      # Server entry point
│   ├── seed_admin.py               # Seeds the first secretary account
│   └── requirements.txt            # Python dependencies
│
├── 📂 web/                         # Web dashboard (static files)
│   ├── 📂 css/                     # Stylesheets
│   ├── 📂 js/                      # Client-side JavaScript
│   ├── 📂 secretary/               # Secretary pages
│   ├── 📂 doctor/                  # Doctor pages
│   └── index.html                  # Login page
│
├── 📂 flutter_app/                 # Flutter mobile app (patients)
│   └── 📂 lib/
│       ├── 📂 core/                # Theme, constants, colors
│       ├── 📂 models/              # Dart data models
│       ├── 📂 providers/           # State management
│       ├── 📂 screens/             # UI screens
│       ├── 📂 services/            # API service layer
│       └── main.dart               # App entry point
│
└── README.md
```

---

## 🚀 Getting Started

### ✅ Prerequisites

- Python 3.10+
- MySQL 8.0+ running locally
- Flutter SDK 3.x (for mobile development)
- A modern web browser

---

### 🖥️ Backend Setup

```bash
# 1. Navigate to the backend directory
cd "C:\Coding Projects\hmss\backend"

# 2. Create and activate a virtual environment
python -m venv venv
venv\Scripts\activate           # Windows
# source venv/bin/activate      # macOS / Linux

# 3. Install dependencies
pip install -r requirements.txt
```

---

### 🗄️ Database Setup

```sql
-- Run inside MySQL:
CREATE DATABASE hmss_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Then configure your database credentials in `config.py` or a `.env` file.

---

### ▶️ Running the Full System

> ⚠️ **Two terminals are required.** Always start Terminal 1 first and keep both open.

**Terminal 1 — Flask Backend**

```bash
cd "C:\Coding Projects\hmss\backend"
venv\Scripts\activate
python seed_admin.py        # First run only — seeds the secretary account
python run.py
```

> API is available at **`http://localhost:5000`**

**Terminal 2 — Web Dashboard**

```bash
cd "C:\Coding Projects\hmss\web"
python -m http.server 8080
```

> Dashboard is available at **`http://localhost:8080`**

---

### 🔑 Default Credentials

| Role | Email | Password |
|------|-------|----------|
| 👩‍💼 Secretary | `secretary@hmss.com` | `Password123` |
| 🩺 Doctor | `dr.smith@hmss.com` | `Password123` |

---

### 📱 Flutter Mobile App Setup

```bash
# 1. Navigate to the Flutter project
cd flutter_app

# 2. Install Flutter dependencies
flutter pub get

# 3. Set the correct API base URL in lib/core/constants.dart
#    Android Emulator:  http://10.0.2.2:5000
#    Physical Device:   http://<YOUR_LAN_IP>:5000

# 4. Run the app
flutter run
```

---

## 🌐 API Reference

| Method | Endpoint | Role | Description |
|--------|----------|------|-------------|
| `POST` | `/api/auth/login` | All | User login — returns JWT token |
| `POST` | `/api/auth/reset-password` | All | Secure password reset |
| `GET` | `/api/doctors` | Secretary | List all doctors |
| `POST` | `/api/patients` | Secretary | Create a patient account |
| `DELETE` | `/api/patients/{id}` | Secretary | Delete a patient account |
| `GET` | `/api/appointments` | All | List appointments (scoped by role) |
| `POST` | `/api/appointments` | Secretary | Schedule a new appointment |
| `PATCH` | `/api/appointments/{id}` | Doctor / Secretary | Confirm or reschedule |
| `DELETE` | `/api/appointments/{id}` | Secretary | Cancel an appointment |
| `GET` | `/api/test-results/{patient_id}` | Patient / Doctor | View test results |
| `POST` | `/api/test-results` | Doctor | Upload a test result |
| `GET` | `/api/notifications` | All | View notifications |
| `POST` | `/api/chatbot` | Patient | Query the medical chatbot |

---

## 🔐 Security

- **JWT authentication** — stateless, token-based sessions for all roles
- **bcrypt password hashing** — passwords are never stored in plaintext
- **Role-based access control** — every endpoint is scoped to its permitted roles only
- **Account lockout** — temporary lock after 3 consecutive failed login attempts
- **Input validation** — all inputs are validated server-side before processing
- **HTTPS-ready** — all client–server communication is designed for encrypted channels

---

## ⚠️ Troubleshooting

| Issue | Solution |
|-------|----------|
| ❌ `ModuleNotFoundError` | Activate venv: `venv\Scripts\activate`, then `pip install -r requirements.txt` |
| 🔌 Port 5000 in use | Find it: `netstat -ano \| findstr :5000` → kill: `taskkill /PID <PID> /F` |
| 🔌 Port 8080 in use | Use a different port: `python -m http.server 9090` |
| 🔐 Database access denied | Verify MySQL credentials in `config.py` match your local MySQL setup |
| 🐬 MySQL not starting | Run `net start MySQL80` (Windows) or `sudo service mysql start` (Linux) |
| 🌐 CORS errors in browser | Ensure `Flask-CORS` is installed and registered in `app/__init__.py` |
| 🔑 JWT token invalid | Make sure `JWT_SECRET_KEY` in config is consistent across server restarts |
| 📱 Flutter can't reach backend | Replace `localhost` with your machine's LAN IP in `lib/core/constants.dart` |
| 📦 Flutter packages missing | Run `flutter pub get` inside the `flutter_app/` directory |

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| `SRS Document` | Full Software Requirements Specification (IEEE Std 830-1998) |
| `ER Diagram` | Database entity-relationship model (13 tables) |
| `Progress Report` | Development milestones and Gantt chart |

---

<p align="center">
  Made with ❤️ by the HMSS Team &nbsp;|&nbsp; Lebanese American University &nbsp;|&nbsp; COE461 — Spring 2026
</p>