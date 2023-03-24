import oracledb as odb
from datetime import datetime


class Utils:
    @staticmethod
    def convert(x: str | datetime | None) -> str:
        if type(x) == datetime:
            return x.strftime(r"%d/%m/%Y")
        elif x is None:
            return "NULL"
        return x


class Database:
    def __init__(self) -> None:
        # Run lsnrctl status to get values
        self.conn: odb.Connection = odb.connect(
            user="system",
            password="lolxd5",
            port=1521,
            host="localhost",
            service_name="deep",
        )

    def close(self) -> None:
        self.conn.close()

    def fetch(self, table: str) -> list:
        with self.conn.cursor() as cursor:
            rows = cursor.execute(f"SELECT * FROM {table}").fetchall()
            rows = list(map(lambda t: tuple(map(lambda x: Utils.convert(x), t)), rows))
            return rows

    def execute(self) -> None:
        with self.conn.cursor() as cursor:
            cursor.execute("INSERT INTO a VALUES(:1)", (1,))

            for row in cursor.execute("SELECT * FROM a"):
                print(row)
