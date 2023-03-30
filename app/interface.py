from PySide6.QtCore import QObject, Qt, QModelIndex, QPersistentModelIndex
from PySide6.QtCore import Slot, Signal, QAbstractTableModel
import sys
from . import database as d


class TableModel(QAbstractTableModel):
    def __init__(self, db: d.Database, parent: QObject | None = None) -> None:
        super().__init__(parent=parent)
        self._data = db.fetch("emp")
        self._db = db

    def headerData(
        self,
        section: int,
        orientation: Qt.Orientation = Qt.Orientation.Horizontal,
        role: int = Qt.DisplayRole,
    ):
        if role == Qt.DisplayRole:
            return f"{section}"
        return ""

    def data(
        self, index: QModelIndex | QPersistentModelIndex, role: int = Qt.DisplayRole
    ):
        if role == Qt.DisplayRole:
            return self._data[index.row()][index.column()]
        return 0

    def rowCount(self, parent: QModelIndex | QPersistentModelIndex = None) -> int:
        return len(self._data)

    def columnCount(self, parent: QModelIndex | QPersistentModelIndex = None) -> int:
        return len(self._data[0])

    def insertRows(
        self, row: int, count: int, parent: QModelIndex | QPersistentModelIndex = None
    ) -> bool:
        super().beginInsertRows(parent, row, count)
        print("hi")
        super().endInsertRows()
        return super().insertRows(row, count, parent)

    def setTable(self, table: str):
        self.beginResetModel()
        buffer = [self._db.fetch_headers(table)]
        buffer.extend(self._db.fetch(table))
        self._data = buffer
        self.endResetModel()


class Bridge(QObject):
    def __init__(self, table: TableModel) -> None:
        super().__init__()
        self._table = table

    updated = Signal(str, arguments=["val"])

    @Slot(str, result=None)
    def setTable(self, table: str):
        self._table.setTable(table)

    @Slot(str, result=str)
    def sayHello(self, val: str) -> str:
        print("hello")
        print(val)
        self.updated.emit("hello world!")
        return "bro"

    @Slot(str, str, result=bool)
    def validate(self, username: str, password: str) -> bool:
        return username == "a" and password == "b"

    @Slot(None, result=None)
    def quit(self) -> None:
        sys.exit(0)
