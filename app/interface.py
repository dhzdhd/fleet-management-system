from PySide6.QtCore import QObject
from PySide6.QtCore import Slot, Signal


class Bridge(QObject):
    def __init__(self) -> None:
        super().__init__()

    updated = Signal(str, arguments=["val"])

    @Slot(str, result=None)
    def sayHello(self, val: str) -> None:
        print("hello")
        print(val)
        self.updated.emit("hello world!")
