from datetime import datetime


class Utils:
    @staticmethod
    def convert(x: str | datetime | None) -> str:
        if type(x) == datetime:
            return x.strftime(r"%d/%m/%Y")
        elif x is None:
            return "NULL"
        return x

    @staticmethod
    def override(f):
        return f
