from PySide6.QtCore import QObject, Qt, QModelIndex, QPersistentModelIndex
from PySide6.QtCore import Slot, Signal, QAbstractTableModel
import sys
from . import database as d


class TableModel(QAbstractTableModel):
    def __init__(self, db: d.Database, parent: QObject | None = None) -> None:
        super().__init__(parent=parent)
        self._data = db.fetch()
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

    def rowCount(self, parent: QModelIndex | QPersistentModelIndex) -> int:
        return len(self._data)

    def columnCount(self, parent: QModelIndex | QPersistentModelIndex) -> int:
        return len(self._data[0])

    def insertRows(
        self, row: int, count: int, parent: QModelIndex | QPersistentModelIndex = None
    ) -> bool:
        super().beginInsertRows(parent, row, count)
        print("hi")
        super().endInsertRows()
        return super().insertRows(row, count, parent)

    def setData(self):
        self.beginResetModel()
        self._data = self._db.fetchOther()
        self.endResetModel()


class Bridge(QObject):
    def __init__(self, table: TableModel) -> None:
        super().__init__()
        self._table = table

    updated = Signal(str, arguments=["val"])

    @Slot(None, result=None)
    def setData(self):
        self._table.setData()

    @Slot(str, result=str)
    def sayHello(self, val: str) -> str:
        print("hello")
        print(val)
        self.updated.emit("hello world!")
        return "bro"

    @Slot(None, result=None)
    def quit(self) -> None:
        sys.exit(0)
