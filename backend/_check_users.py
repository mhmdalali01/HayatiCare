import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from app import create_app
from app.extensions import db
from app.models.user import User
from app.models.notification import Notification

app = create_app()
with app.app_context():
    users = User.query.all()
    print(f"Users: {len(users)}")
    for u in users:
        print(f"  {u.user_id} {u.email} / {u.role}")
    notifs = Notification.query.all()
    print(f"\nNotifications: {len(notifs)}")
    for n in notifs:
        print(f"  {n.notification_id} user={n.user_id} '{n.title}'")
