<p align="center">
  <img src="https://img.shields.io/badge/Flask-3.x-ffffff?style=flat&logo=flask&logoColor=white&labelColor=000000&color=555555" alt="Flask"/>
  &nbsp;
  <img src="https://img.shields.io/badge/MySQL-8.0-white?style=flat&logo=mysql&logoColor=white&labelColor=4479A1&color=005C84" alt="MySQL"/>
  &nbsp;
  <img src="https://img.shields.io/badge/Flutter-3.x-white?style=flat&logo=flutter&logoColor=white&labelColor=02569B&color=0175C2" alt="Flutter"/>
  &nbsp;
  <img src="https://img.shields.io/badge/JavaScript-ES6-black?style=flat&logo=javascript&logoColor=black&labelColor=F7DF1E&color=E6C700" alt="JavaScript"/>
  &nbsp;
  <img src="https://img.shields.io/badge/SQLAlchemy-ORM-white?style=flat&logo=sqlalchemy&logoColor=white&labelColor=D71F00&color=A80000" alt="SQLAlchemy"/>
  &nbsp;
  <img src="https://img.shields.io/badge/bcrypt-Security-white?style=flat&logo=letsencrypt&logoColor=white&labelColor=003A70&color=00509E" alt="bcrypt"/>
  &nbsp;
  <img src="https://img.shields.io/badge/JWT-Auth-white?style=flat&logo=jsonwebtokens&logoColor=white&labelColor=000000&color=333333" alt="JWT"/>
  
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

| Name           |
|----------------|
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

---

### 🔑 Default Credentials

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

### 🔗 Default URLs

| Service | URL |
|---------|-----|
| Backend API | `http://localhost:5000` |
| Web Dashboard | `http://localhost:5000` |
| Mobile App (emulator) | `http://10.0.2.2:5000` |

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
