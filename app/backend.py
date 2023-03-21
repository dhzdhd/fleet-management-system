import oracledb as odb


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

    def execute(self) -> None:
        with self.conn.cursor() as cursor:
            cursor.execute("CREATE TABLE a(b NUMBER)")
            cursor.execute("INSERT INTO a VALUES(:1)", (1,))

            for row in cursor.execute("SELECT * FROM a"):
                print(row)

            cursor.execute("DROP TABLE a")
