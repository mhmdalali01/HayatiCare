# HayatiCare — PROJECT STATUS REPORT
**Generated:** 2026-05-15  
**Team:** Mohamad Al Ali, Mohammad Sinn, Ahmad Ghaddar, Omar Saadeh  
**Project:** Hospital Management Software System (HMSS)

---

## 1.1 DIRECTORY TREE

```
HayatiCare/
├── backend/
│   ├── app/
│   │   ├── models/
│   │   │   ├── __init__.py
│   │   │   ├── appointment.py
│   │   │   ├── audit_log.py
│   │   │   ├── body_health.py              ← extra (not in spec)
│   │   │   ├── chat_query_log.py
│   │   │   ├── chatbot_faq_entry.py
│   │   │   ├── doctor.py
│   │   │   ├── medical_test.py
│   │   │   ├── notification.py
│   │   │   ├── patient.py
│   │   │   ├── patient_doctor_assignment.py
│   │   │   ├── patient_medical_result.py   ← extra (not in spec)
│   │   │   ├── secretary.py
│   │   │   ├── test_normal_range.py
│   │   │   ├── test_result.py
│   │   │   └── user.py
│   │   ├── routes/
│   │   │   ├── appointments.py
│   │   │   ├── auth.py
│   │   │   ├── body_health.py              ← extra
│   │   │   ├── chatbot.py
│   │   │   ├── doctors.py
│   │   │   ├── medical_tests.py
│   │   │   ├── notifications.py
│   │   │   ├── patient_results.py          ← extra
│   │   │   ├── patients.py
│   │   │   ├── secretary.py
│   │   │   └── test_results.py
│   │   ├── services/
│   │   │   ├── appointment_service.py
│   │   │   ├── auth_service.py
│   │   │   ├── chatbot_service.py
│   │   │   ├── notification_service.py
│   │   │   └── test_validation_service.py
│   │   ├── utils/
│   │   │   ├── decorators.py
│   │   │   ├── responses.py
│   │   │   └── validators.py
│   │   ├── __init__.py
│   │   └── extensions.py
│   ├── migrations/
│   ├── config.py
│   ├── run.py
│   ├── seed_admin.py
│   └── seed_data.py
│
├── flutter_app/                   ← PRIMARY mobile app
│   └── lib/
│       ├── core/
│       │   ├── constants.dart
│       │   ├── constants/
│       │   │   ├── app_colors.dart
│       │   │   ├── app_text_styles.dart
│       │   │   └── doctor_avatars.dart
│       │   └── theme.dart
│       ├── models/
│       │   ├── appointment_model.dart
│       │   ├── body_health_model.dart
│       │   ├── doctor_model.dart
│       │   ├── notification_model.dart
│       │   ├── test_result_model.dart
│       │   └── user_model.dart
│       ├── providers/
│       │   ├── appointments_provider.dart
│       │   ├── auth_provider.dart
│       │   ├── body_health_provider.dart
│       │   ├── chatbot_provider.dart
│       │   ├── doctors_provider.dart
│       │   ├── notifications_provider.dart
│       │   └── test_results_provider.dart
│       ├── screens/
│       │   ├── appointments_screen.dart
│       │   ├── batch_detail_screen.dart
│       │   ├── body_health_screen.dart
│       │   ├── chatbot_screen.dart
│       │   ├── dashboard_screen.dart
│       │   ├── home_test_screen.dart
│       │   ├── login_screen.dart
│       │   ├── main_screen.dart
│       │   ├── notifications_screen.dart
│       │   ├── patient/doctor_profile_screen.dart
│       │   ├── register_screen.dart
│       │   └── test_results_screen.dart
│       ├── services/
│       │   ├── api_service.dart
│       │   └── medical_ai_service.dart     ← local AI (no LLM calls)
│       ├── app.dart
│       └── main.dart
│
├── android/                       ← LEGACY Android/Java app (not primary)
│   └── app/src/main/java/com/hmss/
│       ├── LoginActivity.java
│       ├── MainActivity.java
│       ├── PatientDashboardActivity.java
│       ├── AppointmentsActivity.java
│       ├── ChatbotActivity.java
│       ├── HomeTestSubmitActivity.java
│       ├── SignUpActivity.java
│       ├── TestResultsActivity.java
│       └── models/, network/
│
├── web/
│   ├── css/styles.css
│   ├── js/
│   │   ├── api.js
│   │   ├── auth.js
│   │   ├── doctor.js
│   │   └── secretary.js
│   ├── secretary/
│   │   ├── dashboard.html
│   │   ├── appointments.html
│   │   ├── manage_patients.html
│   │   ├── manage_doctors.html
│   │   ├── notifications.html
│   │   ├── results.html
│   │   └── test_detail.html
│   ├── doctor/
│   │   ├── dashboard.html
│   │   ├── appointments.html
│   │   ├── patient_records.html
│   │   ├── results.html
│   │   ├── flagged_results.html
│   │   ├── results_batch.html
│   │   └── results_patient.html
│   └── index.html                 ← shared login page
│
├── venv/
├── .env
├── .env.example
├── requirements.txt
├── README.md
└── test_login.ps1
```

---

## 1.2 TECH STACK DETECTED

### Backend (`requirements.txt` + imports)
| Library | Version | Purpose |
|---------|---------|---------|
| Flask | latest | Web framework |
| Flask-SQLAlchemy | latest | ORM |
| Flask-JWT-Extended | latest | JWT auth (access + refresh tokens) |
| Flask-Migrate | latest | DB schema migrations (Alembic) |
| Flask-CORS | latest | Cross-Origin Resource Sharing |
| PyMySQL | latest | MySQL driver |
| bcrypt | latest | Password hashing (cost factor default ~12) |
| python-dotenv | latest | `.env` loading |

### Mobile — Flutter (`pubspec.yaml`)
| Package | Version | Purpose |
|---------|---------|---------|
| Flutter SDK | ≥3.0.0 | Cross-platform framework |
| dio | ^5.4.0 | HTTP client |
| flutter_riverpod | ^2.5.1 | State management |
| flutter_secure_storage | ^9.0.0 | JWT token storage |
| intl | ^0.19.0 | Date formatting |
| google_fonts | ^6.2.0 | Typography |
| cached_network_image | ^3.3.0 | Image caching |
| shimmer | ^3.0.0 | Loading skeletons |

### Web Dashboard
- Plain HTML5, CSS3, Vanilla JavaScript (no framework)
- Served as static files directly through Flask

### Legacy Android App (`android/app/build.gradle`)
- Android / Java (not the primary mobile app — Flutter is primary)

---

## 1.3 DATABASE SCHEMA STATUS

| Table | Status | Notes |
|-------|--------|-------|
| **USER** | EXISTS ✓ | All spec columns present. `updated_at` present. |
| **PATIENT** | EXISTS ✓ | All spec columns present. `national_id` has `unique=True`. |
| **DOCTOR** | EXISTS ✓ | All spec columns present. |
| **SECRETARY** | EXISTS ✓ | All spec columns present. |
| **PATIENT_DOCTOR_ASSIGNMENT** | EXISTS ✓ | All spec columns present. |
| **APPOINTMENT** | EXISTS ✓ | `created_by_id` → named `created_by_user_id` in model (FK to user). `managed_by_secretary` → named `managed_by_secretary_id`. Functionally equivalent. |
| **MEDICAL_TEST** | EXISTS ✓ | All spec columns present. |
| **TEST_NORMAL_RANGE** | EXISTS ✓ | All spec columns present. |
| **TEST_RESULT** | EXISTS ✓ | All spec columns present. `validated_by_id` → named `validated_by_user_id`. |
| **NOTIFICATION** | EXISTS ✓ | All spec columns present. |
| **AUDIT_LOG** | EXISTS ✓ | All spec columns present. |
| **CHATBOT_FAQ_ENTRY** | EXISTS ✓ | Model file confirmed in models/__init__.py import. |
| **CHAT_QUERY_LOG** | EXISTS ✓ | Model file confirmed in models/__init__.py import. |
| **BODY_HEALTH** | EXISTS (EXTRA) | Not in spec. Stores patient BMI, height, weight, calorie limit. Created dynamically if missing. |
| **PATIENT_MEDICAL_RESULT** | EXISTS (EXTRA) | Not in spec. Alternative batch test-result upload table. |

**Schema verdict:** All 13 required tables are present. Two extra tables exist that go beyond the spec but do not conflict with it.

---

## 1.4 API ENDPOINTS STATUS

### AUTH  `/api/auth`
| Method | Path | Role | Status |
|--------|------|------|--------|
| POST | /api/auth/login | Public | IMPLEMENTED ✓ |
| POST | /api/auth/logout | Any auth | IMPLEMENTED ✓ |
| POST | /api/auth/reset-password-request | Public | IMPLEMENTED ✓ |
| POST | /api/auth/reset-password-confirm | Public | IMPLEMENTED ✓ |
| GET | /api/auth/me | Any auth | **MISSING** ✗ |
| POST | /api/auth/refresh | Any auth | IMPLEMENTED (extra) |
| POST | /api/auth/register | Public | IMPLEMENTED (extra — patient self-register) |

### PATIENTS  `/api/patients`
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/patients | Secretary | IMPLEMENTED ✓ |
| POST | /api/patients | Secretary | IMPLEMENTED ✓ |
| GET | /api/patients/\<id\> | Secretary/Doctor/Patient(self) | IMPLEMENTED ✓ |
| PUT | /api/patients/\<id\> | Secretary | IMPLEMENTED ✓ |
| DELETE | /api/patients/\<id\> | Secretary | IMPLEMENTED ✓ |
| GET | /api/patients/\<id\>/medical-history | Doctor/Secretary | IMPLEMENTED ✓ (as `/medical-history`) |
| POST | /api/patients/\<id\>/home-tests | Patient(self) | IMPLEMENTED ✓ (as `/home-tests`) |
| GET | /api/patients/me | Patient | IMPLEMENTED (extra) |
| GET | /api/patients/my-patients | Doctor | IMPLEMENTED (extra) |

### DOCTORS  `/api/doctors`
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/doctors | Any auth | IMPLEMENTED ✓ |
| POST | /api/doctors | Secretary | IMPLEMENTED ✓ |
| GET | /api/doctors/\<id\> | Any auth | IMPLEMENTED ✓ |
| PUT | /api/doctors/\<id\> | Secretary | IMPLEMENTED ✓ |
| DELETE | /api/doctors/\<id\> | Secretary | IMPLEMENTED ✓ |
| GET | /api/doctors/\<id\>/patients | Doctor(self)/Secretary | IMPLEMENTED ✓ |
| GET | /api/doctors/available | Any auth | IMPLEMENTED (extra) |

### APPOINTMENTS  `/api/appointments`
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/appointments | Secretary/Doctor/Patient | IMPLEMENTED ✓ |
| POST | /api/appointments | Secretary/Patient | IMPLEMENTED ✓ |
| GET | /api/appointments/\<id\> | Involved parties | IMPLEMENTED ✓ |
| PUT | /api/appointments/\<id\> | Doctor/Secretary | IMPLEMENTED ✓ |
| DELETE | /api/appointments/\<id\> | Secretary | IMPLEMENTED ✓ |
| GET | /api/appointments/slots | Secretary/Doctor | IMPLEMENTED (extra) |

### TEST RESULTS  `/api/test-results`
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/test-results | Doctor/Secretary/Patient | IMPLEMENTED ✓ |
| POST | /api/test-results | Doctor/Secretary | IMPLEMENTED ✓ |
| GET | /api/test-results/\<id\> | Involved parties | IMPLEMENTED ✓ |
| GET | /api/test-results/flagged | Doctor/Secretary | IMPLEMENTED ✓ |

### NOTIFICATIONS  `/api/notifications`
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/notifications | Any auth (own) | IMPLEMENTED ✓ |
| POST | /api/notifications | Doctor/Secretary | IMPLEMENTED ✓ |
| PUT | /api/notifications/\<id\>/read | Any auth (own) | IMPLEMENTED ✓ |
| DELETE | /api/notifications/\<id\> | Any auth (own) | IMPLEMENTED (extra) |

### CHATBOT  `/api/chatbot`
| Method | Path | Role | Status |
|--------|------|------|--------|
| POST | /api/chatbot/query | Patient | IMPLEMENTED ✓ |
| GET | /api/chatbot/faqs | Any auth | IMPLEMENTED ✓ (as `/faqs`) |

### AUDIT  `/api/audit`
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/audit | Secretary | **MISSING** ✗ |

### SECRETARY  `/api/secretaries` (blueprint prefix)
| Method | Path | Role | Status |
|--------|------|------|--------|
| GET | /api/secretaries | Secretary | IMPLEMENTED ✓ |
| POST | /api/secretaries | Secretary | IMPLEMENTED ✓ |
| GET | /api/secretaries/\<id\> | Any auth | IMPLEMENTED ✓ |
| GET | /api/secretaries/dashboard-summary | Secretary | IMPLEMENTED ✓ |

---

## 1.5 FRONTEND STATUS (Web Dashboard)

| Page | Purpose | Status |
|------|---------|--------|
| `index.html` | Shared login (Doctor + Secretary) | COMPLETE ✓ |
| `secretary/dashboard.html` | Summary, today's schedule, doctor workload | COMPLETE ✓ |
| `secretary/appointments.html` | Full appointment management | COMPLETE ✓ |
| `secretary/manage_patients.html` | Patient CRUD | COMPLETE ✓ |
| `secretary/manage_doctors.html` | Doctor CRUD | COMPLETE ✓ |
| `secretary/notifications.html` | View/send notifications | COMPLETE ✓ |
| `secretary/results.html` | Upload and view test results | COMPLETE ✓ |
| `secretary/test_detail.html` | Test detail view by code | COMPLETE ✓ |
| `doctor/dashboard.html` | Flagged results, upcoming appointments | COMPLETE ✓ |
| `doctor/appointments.html` | Doctor's appointments | COMPLETE ✓ |
| `doctor/patient_records.html` | Patient list + records | COMPLETE ✓ |
| `doctor/results.html` | Test results management | COMPLETE ✓ |
| `doctor/flagged_results.html` | Abnormal results view | COMPLETE ✓ |
| `doctor/results_batch.html` | Batch result upload | COMPLETE ✓ |
| `doctor/results_patient.html` | Per-patient results view | COMPLETE ✓ |

**Web dashboard verdict:** All expected pages exist. No pages are missing.

---

## 1.6 MOBILE APP STATUS

**Primary framework: Flutter** (at `flutter_app/`)  
**Secondary: Android/Java** (at `android/` — legacy, not the active mobile app)

### Flutter Screens

| Screen File | Purpose | Status |
|------------|---------|--------|
| `login_screen.dart` | Patient login | COMPLETE ✓ |
| `register_screen.dart` | Patient self-registration | COMPLETE ✓ |
| `dashboard_screen.dart` | Patient home / overview | COMPLETE ✓ |
| `appointments_screen.dart` | View upcoming + past appointments | COMPLETE ✓ |
| `home_test_screen.dart` | Submit home measurement | COMPLETE ✓ |
| `test_results_screen.dart` | View results with abnormal highlighting | COMPLETE ✓ |
| `chatbot_screen.dart` | Medical chatbot (FAQ + ranges only) | COMPLETE ✓ |
| `notifications_screen.dart` | View notifications | COMPLETE ✓ |
| `patient/doctor_profile_screen.dart` | View doctor profile | COMPLETE ✓ |
| `body_health_screen.dart` | BMI + calorie tracker | COMPLETE (extra) |
| `batch_detail_screen.dart` | Batch result detail | COMPLETE (extra) |
| `main_screen.dart` | Navigation shell (bottom nav) | COMPLETE ✓ |

**Missing from spec:**
- Dedicated "Request Appointment" screen — functionality appears to be embedded in `appointments_screen.dart` (not a separate screen). **PARTIAL** — needs confirmation.

### Mobile AI Feature
`medical_ai_service.dart` implements a **local, offline AI** chatbot that:
- Contains a hardcoded dictionary of 13 medical tests (GLU, HGB, CHOL, WBC, BP, PLT, NA, K, CRE, ALT, AST, SPO2, TEMP)
- Returns normal ranges and test roles via keyword matching
- Enforces a forbidden-query blacklist (no diagnosis, treatment, medication words)
- Appends no external API calls — runs fully on-device
- The Flutter `ChatbotScreen` calls this service; `chatbot_provider.dart` connects to either this local service or the backend `/api/chatbot/query` endpoint

---

## 1.7 BUSINESS LOGIC STATUS

| Rule | Description | Status | Notes |
|------|-------------|--------|-------|
| **BL-1** | Abnormal test result auto-flagging | **IMPLEMENTED** ✓ | `test_validation_service.py::validate_and_flag()`. Finds best matching `TEST_NORMAL_RANGE` by sex/age/fasting_state cascade. Sets `is_flagged`, `status`, `applied_range_id`, `validated_at`. Sends notifications to patient + doctor when flagged. |
| **BL-2** | Appointment conflict detection | **IMPLEMENTED** ✓ | `appointment_service.py::check_conflict()`. Overlap formula: `existing.start < new.end AND existing.end > new.start`. Checks both doctor AND patient. Used on create AND update. Returns 409-equivalent ValueError. |
| **BL-3** | Account lockout after 3 failed login attempts | **PARTIAL** ⚠ | `auth_service.py`. In-memory dict tracks failures per email. After 3 failures, `user.is_active = False` is written to DB (persistent). Counter itself is in-memory (resets on server restart — locked accounts stay locked in DB but counter resets). Generic error messages used; email existence is not revealed. |
| **BL-4** | Input validation | **PARTIAL** ⚠ | Email format validated. Required fields validated. Password **complexity rules NOT enforced** (spec: 8+ chars, uppercase, lowercase, digit). Only a non-empty check is applied. |
| **BL-5** | Chatbot restriction | **IMPLEMENTED** ✓ | Backend: `chatbot_service.py` keyword-matches against `CHATBOT_FAQ_ENTRY` only. Hard disclaimer appended to every response. "I cannot provide medical advice" fallback used. Mobile: `medical_ai_service.dart` adds a forbidden-keyword filter client-side. No LLM calls — no diagnosis risk. |
| **BL-6** | Role-based access control | **IMPLEMENTED** ✓ | `decorators.py::role_required()` + `any_authenticated()`. JWT role claim checked before every query. Returns 403 on role mismatch, 401 on missing token. Consistent 403 (not 404) for unauthorized access. |

---

## 1.8 WHAT IS MISSING — PRIORITY LIST

Listed from highest to lowest priority:

| # | Priority | Item | Files to Create / Modify |
|---|----------|------|--------------------------|
| 1 | **HIGH** | `GET /api/auth/me` endpoint — returns the current user's profile | `backend/app/routes/auth.py` |
| 2 | **HIGH** | `GET /api/audit` endpoint — Secretary-only retrieval of audit logs | `backend/app/routes/` (new `audit.py`) + register in `app/__init__.py` |
| 3 | **MEDIUM** | Password complexity validation (BL-4) — enforce 8+ chars, uppercase, lowercase, digit on account creation/update | `backend/app/utils/validators.py`, `backend/app/routes/auth.py`, `backend/app/routes/patients.py`, `backend/app/routes/doctors.py` |
| 4 | **MEDIUM** | Account lockout counter persistence (BL-3) — in-memory counter resets on server restart; locked accounts remain locked in DB but counter is lost | `backend/app/services/auth_service.py` (use Redis or DB-backed counter) |
| 5 | **LOW** | Dedicated "Request Appointment" screen in Flutter — if not already reachable from `appointments_screen.dart` | `flutter_app/lib/screens/` |
| 6 | **LOW** | README default credentials section slightly outdated (references `dr.smith` / `dr.jones` but seed file may differ) | `README.md` |
| 7 | **INFO** | Two extra tables (`body_health`, `patient_medical_result`) and routes are beyond spec — they work but are undocumented in the spec | No action required unless removing scope |
| 8 | **INFO** | Legacy Android/Java app at `android/` is superseded by the Flutter app — may cause confusion | No action required |

---

## SUMMARY

| Layer | Completeness |
|-------|-------------|
| Database models | 100% (all 13 spec tables + 2 extra) |
| Backend routes | ~95% (missing: `/api/auth/me`, `/api/audit`) |
| Business logic | ~85% (missing: password complexity, in-memory lockout counter) |
| Web dashboard | 100% (all expected pages present) |
| Flutter mobile app | ~95% (all screens present; request-appointment flow needs verification) |
| Security (bcrypt, JWT, RBAC, parameterized SQL) | 100% |
| Notification system | 100% |
| Chatbot restriction | 100% |
