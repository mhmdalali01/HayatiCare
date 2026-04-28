# Hospital Management Software System (HMSS)

**Team:** Mohamad Al Ali, Mohammad Sinn, Ahmad Ghaddar, Omar Saadeh

A full-stack hospital management system supporting three user roles: Patient (Android mobile app), Doctor and Secretary (web dashboard), backed by a Python/Flask REST API and MySQL database.

---

## System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        CLIENTS                                  │
│                                                                 │
│  ┌──────────────────┐   ┌──────────────────────────────────┐   │
│  │  Android App     │   │        Web Dashboard             │   │
│  │  (Patient)       │   │  (Doctor & Secretary)            │   │
│  │  Retrofit 2      │   │  HTML + CSS + Vanilla JS         │   │
│  └────────┬─────────┘   └───────────────┬──────────────────┘   │
└───────────┼───────────────────────────────┼─────────────────────┘
            │  HTTPS + JWT                  │  HTTPS + JWT
            ▼                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                    BACKEND (Flask REST API)                     │
│                                                                 │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────────┐   │
│  │  auth    │  │patients  │  │ doctors  │  │appointments  │   │
│  │  routes  │  │  routes  │  │  routes  │  │   routes     │   │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘  └──────┬───────┘   │
│       └─────────────┴─────────────┴────────────────┘           │
│                           │                                     │
│  ┌────────────────────────▼──────────────────────────────────┐ │
│  │                     SERVICES                              │ │
│  │  auth_service │ appointment_service │ test_validation     │ │
│  │  notification_service │ chatbot_service                   │ │
│  └────────────────────────┬──────────────────────────────────┘ │
│                           │                                     │
│  ┌────────────────────────▼──────────────────────────────────┐ │
│  │                  MODELS (SQLAlchemy ORM)                  │ │
│  │  User │ Patient │ Doctor │ Secretary │ Appointment        │ │
│  │  TestResult │ MedicalTest │ Notification │ AuditLog       │ │
│  └────────────────────────┬──────────────────────────────────┘ │
└───────────────────────────┼─────────────────────────────────────┘
                            │
                            ▼
              ┌─────────────────────────┐
              │     MySQL 8+ Database   │
              │         (hmss_db)       │
              └─────────────────────────┘
```

---

## Prerequisites

- Python 3.10+
- MySQL 8.0+
- Android Studio (Flamingo or newer)
- pip (Python package manager)
- A modern web browser (Chrome, Firefox, or Edge)

---

## Setup Instructions

### 1. Clone / Download the Project

```bash
git clone <repo-url> hmss
cd hmss
```

### 2. Backend Setup

```bash
# Create and activate a virtual environment
python -m venv venv
# Windows
venv\Scripts\activate
# macOS/Linux
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Copy environment file and fill in values
cp .env.example .env
# Edit .env with your database credentials and secret keys
```

### 3. Database Setup

Log in to MySQL and create the database and user:

```sql
CREATE DATABASE hmss_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'hmss_user'@'localhost' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON hmss_db.* TO 'hmss_user'@'localhost';
FLUSH PRIVILEGES;
```

### 4. Run Database Migrations

```bash
mysql -u hmss_user -p hmss_db < backend/migrations/schema.sql
```

### 5. Seed Sample Data

```bash
# From the project root with venv activated
cd backend
python seed_data.py
```

Sample seed script creates:
- 1 Secretary account: `secretary@hmss.com` / `Password123`
- 2 Doctor accounts: `dr.smith@hmss.com` / `Password123`
- 3 Patient accounts: `patient1@hmss.com` / `Password123`
- Sample medical tests and normal ranges
- Sample appointments and test results

### 6. Run the Backend Server

```bash
cd backend
python run.py
```

The API will be available at `http://localhost:5000`.

---

## Web Dashboard

Open `web/index.html` in a browser, or serve it with any static file server:

```bash
# Using Python's built-in server
cd web
python -m http.server 8080
```

Navigate to `http://localhost:8080`.

**Login credentials (after seeding):**
- Secretary: `secretary@hmss.com` / `Password123`
- Doctor: `dr.smith@hmss.com` / `Password123`

---

## Android App

1. Open Android Studio.
2. Select **Open** and navigate to the `android/` folder.
3. Open `android/app/src/main/java/com/hmss/network/ApiClient.java`.
4. Update `BASE_URL` to point to your backend:
   ```java
   private static final String BASE_URL = "http://10.0.2.2:5000/"; // Android emulator
   // or use your machine's LAN IP for a physical device
   ```
5. Click **Run** to build and deploy to emulator or device.

**Minimum SDK:** Android 5.0 (API level 21)

---

## API Base URL Configuration

| Environment | URL |
|-------------|-----|
| Local (web) | `http://localhost:5000` |
| Local (Android emulator) | `http://10.0.2.2:5000` |
| Production | `https://your-domain.com` |

Update `web/js/api.js` (`BASE_URL` constant) and `android/.../ApiClient.java` (`BASE_URL`) accordingly.

---

## Database Backup Instructions

```bash
# Full backup
mysqldump -u hmss_user -p hmss_db > backup_$(date +%Y%m%d_%H%M%S).sql

# Restore from backup
mysql -u hmss_user -p hmss_db < backup_YYYYMMDD_HHMMSS.sql

# Automated daily backup (add to cron)
0 2 * * * mysqldump -u hmss_user -p'your_password' hmss_db > /backups/hmss_$(date +\%Y\%m\%d).sql
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `ModuleNotFoundError` | Run `pip install -r requirements.txt` in your venv |
| `Access denied for user` | Check `.env` DB credentials match MySQL user |
| `Can't connect to MySQL server` | Ensure MySQL service is running: `sudo service mysql start` |
| JWT `Invalid token` errors | Check `JWT_SECRET_KEY` in `.env` matches across restarts |
| Android `CLEARTEXT communication not permitted` | Add `android:usesCleartextTraffic="true"` in `AndroidManifest.xml` for local dev only |
| Web dashboard CORS errors | Ensure Flask-CORS is installed and `CORS(app)` is called in `__init__.py` |
| Port 5000 already in use | Change port in `backend/run.py` or kill the process using that port |
