import oracledb as odb
import oracledb.exceptions as odbe
from .utils import Utils
from dotenv import load_dotenv
from os import getenv


class Database:
    def __init__(self) -> None:
        # Run lsnrctl status to get values
        load_dotenv()

        user = getenv("USER")
        password = getenv("PASSWORD")
        host = getenv("HOST")
        service_name = getenv("SERVICE_NAME")

        self.conn: odb.Connection = odb.connect(
            user=user if user is not None else "system",
            password=password if password is not None else "lolxd5",
            port=1521,
            host=host if host is not None else "localhost",
            service_name=service_name if service_name is not None else "deep",
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
