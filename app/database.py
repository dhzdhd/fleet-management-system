import oracledb as odb
import oracledb.exceptions as odbe
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

    def run_migration(self) -> None:
        with open("app/sql/create_table.sql", "r") as f:
            sql = f.read().split(";")

            with self.conn.cursor() as cursor:
                for x in sql[:-1]:
                    try:
                        cursor.execute(x)
                    except odbe.DatabaseError:
                        print("Table already created")
                self.conn.commit()

    def close(self) -> None:
        self.conn.close()

    def fetch(self, table: str) -> list[list[str]]:
        with self.conn.cursor() as cursor:
            rows = cursor.execute(f"SELECT * FROM {table}").fetchall()
            rows = list(map(lambda t: tuple(map(lambda x: Utils.convert(x), t)), rows))
            return [list(i) for i in rows]

    def fetch_headers(self, table: str) -> list[list[str]]:
        with self.conn.cursor() as cursor:
            rows = cursor.execute(
                f"SELECT column_name FROM USER_TAB_COLUMNS WHERE table_name='{table.upper()}'"
            ).fetchall()
            return list([i[0] for i in rows])

    def execute(self) -> None:
        with self.conn.cursor() as cursor:
            cursor.execute("INSERT INTO a VALUES(:1)", (1,))

            for row in cursor.execute("SELECT * FROM a"):
                print(row)
