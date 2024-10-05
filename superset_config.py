from datetime import timedelta

WTF_CSRF_ENABLED = True
SESSION_COOKIE_HTTPONLY = True
SESSION_COOKIE_SECURE = False  # Set to True if using HTTPS
WTF_CSRF_TIME_LIMIT = int(timedelta(weeks=1).total_seconds())
