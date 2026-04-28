"""
seed_admin.py — Bootstrap the first secretary account on a fresh database.

Usage (from the backend/ directory):
    python seed_admin.py

Override defaults with environment variables:
    ADMIN_EMAIL=my@email.com ADMIN_PASSWORD=StrongPass1 python seed_admin.py
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from app import create_app
from app.extensions import db
from app.models.user import User
from app.models.secretary import Secretary
from app.services.auth_service import hash_password

EMAIL    = os.environ.get("ADMIN_EMAIL",    "admin@hmss.local")
PASSWORD = os.environ.get("ADMIN_PASSWORD", "ChangeMe123!")
FIRST    = os.environ.get("ADMIN_FIRST",    "Admin")
LAST     = os.environ.get("ADMIN_LAST",     "Secretary")
EMP_CODE = os.environ.get("ADMIN_EMP_CODE", "SEC-001")

app = create_app("development")

with app.app_context():
    if User.query.filter_by(email=EMAIL).first():
        print(f"[skip] User '{EMAIL}' already exists — no changes made.")
        sys.exit(0)

    user = User(
        role="secretary",
        first_name=FIRST,
        last_name=LAST,
        email=EMAIL,
        password_hash=hash_password(PASSWORD),
    )
    db.session.add(user)
    db.session.flush()

    sec = Secretary(user_id=user.user_id, employee_code=EMP_CODE)
    db.session.add(sec)
    db.session.commit()

    print(f"[ok]  Secretary created: {EMAIL}")
    print(f"[ok]  Temporary password: {PASSWORD}")
    print("[!!!] Change this password immediately after first login.")
