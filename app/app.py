import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from . import interface as i
from . import database as d
from pathlib import Path


def setup():
    # sys.argv += ["--style", "material"]
    app = QGuiApplication(sys.argv)

    db = d.Database()
    db.run_migration()

    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)
    engine.load(Path(__file__).parent / "qml/main.qml")

    table = i.TableModel(db, None)
    bridge = i.Bridge(table)

    engine.rootObjects()[0].setProperty("bridge", bridge)
    engine.rootContext().setContextProperty("tableModel", table)
    # engine.rootObjects()[0].setProperty("tableModel", table)

    sys.exit(app.exec())
