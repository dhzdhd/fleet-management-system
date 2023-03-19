import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from . import backend as b


def setup():
    app = QGuiApplication(sys.argv)

    db = b.Database()
    db.execute()
    db.close()

    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)
    engine.load("app/qml/main.qml")

    sys.exit(app.exec())
