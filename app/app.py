import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from . import interface as i
from . import database as d
from pathlib import Path


def setup():
    app = QGuiApplication(sys.argv)

    bridge = i.Bridge()
    db = d.Database()
    db.execute()
    db.close()

    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)
    engine.load(Path(__file__).parent / "qml/main.qml")

    engine.rootObjects()[0].setProperty("interbridge", bridge)

    sys.exit(app.exec())
