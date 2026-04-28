"""
utils/validators.py — Input validation helpers.

All validation functions return (is_valid: bool, error_message: str | None).
"""

import re


# Regex: letters, numbers, underscores only, 3-15 characters
_USERNAME_RE = re.compile(r"^[a-zA-Z0-9_]{3,15}$")


def validate_username(value: str):
    """
    Validate a username:
      - Not empty
      - 3–15 characters
      - Only letters, numbers, underscores
    Returns (True, None) on success, (False, reason) on failure.
    """
    if not value or not value.strip():
        return False, "Username must not be empty"
    if not _USERNAME_RE.match(value):
        return False, "Username must be 3–15 characters and contain only letters, numbers, and underscores"
    return True, None


def validate_password(value: str):
    """
    Validate a plain-text password:
      - Not empty
      - 3–15 characters (per project spec)
      - Only letters, numbers, underscores
    Returns (True, None) on success, (False, reason) on failure.
    """
    if not value or not value.strip():
        return False, "Password must not be empty"
    if not _USERNAME_RE.match(value):
        return False, "Password must be 3–15 characters and contain only letters, numbers, and underscores"
    return True, None


def validate_email(value: str):
    """Basic email format check."""
    if not value or "@" not in value:
        return False, "Invalid email address"
    return True, None


def validate_required_fields(data: dict, required: list):
    """
    Check that all field names in `required` are present and non-empty in `data`.
    Returns (True, None) or (False, error message listing missing fields).
    """
    missing = [f for f in required if not data.get(f)]
    if missing:
        return False, f"Missing required fields: {', '.join(missing)}"
    return True, None
