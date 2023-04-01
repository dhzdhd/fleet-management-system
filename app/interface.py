from PySide6.QtCore import QObject, Qt, QModelIndex, QPersistentModelIndex
from PySide6.QtCore import (
    Slot,
    Signal,
    QAbstractTableModel,
    QAbstractListModel,
    QByteArray,
)
import sys
from . import database as d
from .utils import Utils


class TableModel(QAbstractTableModel):
    def __init__(self, db: d.Database, parent: QObject | None = None) -> None:
        super().__init__(parent=parent)
        self._db = db
        self._data = self.prepareData("emp")

    @Utils.override
    def headerData(
        self,
        section: int,
        _: Qt.Orientation = Qt.Orientation.Horizontal,
        role: int = Qt.DisplayRole,
    ):
        if role == Qt.DisplayRole:
            return f"{section}"
        return ""

    @Utils.override
    def data(
        self, index: QModelIndex | QPersistentModelIndex, role: int = Qt.DisplayRole
    ):
        if role == Qt.DisplayRole:
            return self._data[index.row()][index.column()]

    @Utils.override
    def rowCount(self, _: QModelIndex | QPersistentModelIndex = None) -> int:
        return len(self._data)

    @Utils.override
    def columnCount(self, _: QModelIndex | QPersistentModelIndex = None) -> int:
        return len(self._data[0])

    def cellAtPosition(self, row: int, column: int) -> str:
        return self._data[row][column]

    def rowAtIndex(self, row: int) -> list[str]:
        return self._data[row]

    def prepareData(self, table: str) -> list[list[str]]:
        headers = [" ", *self._db.fetch_headers(table)]
        data = list(map(lambda x: ["-", *x], self._db.fetch(table)))
        return [headers, *data]

    def setTable(self, table: str):
        self.beginResetModel()
        self._data = self.prepareData(table)
        self.endResetModel()


class ListModel(QAbstractListModel):
    DataRole = Qt.UserRole + 1

    def __init__(self, db: d.Database, parent: QObject | None = None) -> None:
        super().__init__(parent=parent)
        self._db = db
        self._data = [{"listData": 1}, {"listData": 2}]

    def rowCount(self, parent: QModelIndex | QPersistentModelIndex) -> int:
        return len(self._data)

    def data(self, index: QModelIndex, QPersistentModelIndex, role: int = ...):
        if role == Qt.DisplayRole:
            return self._data[index.row()].get("listData")

    def roleNames(self) -> dict[int, QByteArray]:
        return {
            ListModel.DataRole: b"listData",
        }


class Bridge(QObject):
    currentRowChanged = Signal(int)

    def __init__(self, table: TableModel) -> None:
        super().__init__()
        self._table = table
        self._currentRow = 0

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
        return username == "a" and password == "b"  # ! Make env file

    @Slot(int, result=None)
    def updateCurrentRow(self, row: int) -> None:
        self._currentRow = row
        self.currentRowChanged.emit(row)

    @Slot(None, result=None)
    def quit(self) -> None:
        sys.exit(0)
