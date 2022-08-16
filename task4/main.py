import psycopg2
import os

def create_db(user, name: str):
    os.system(f'createdb -U {user} {name}')


def create_table(connection, table_name: str, **table_columns):
    with connection:
        with connection.cursor() as cur:
            cur.execute(f"""
                    DROP TABLE IF EXISTS {table_name} CASCADE;
                """)
            connection.commit()
            cur.execute(f"""
                    CREATE TABLE IF NOT EXISTS {table_name} ({table_name}_id SERIAL PRIMARY KEY);
                """)
            connection.commit()
            for column_name, column_type in table_columns.items():
                cur.execute(f"""
                    ALTER TABLE {table_name} ADD COLUMN {column_name} {column_type};
                """)
                connection.commit()
            print(f'table {table_name} is created')


def add_client(connection, table_name: str, **data):
    with connection:
        with connection.cursor() as cur:
            cur.execute(f"""
                    INSERT INTO {table_name}({", ".join(column for column in data.keys())})
                    VALUES ({", ".join(string for string in data.values())});
                """)
            connection.commit()
            cur.execute(f"""
                    SELECT {table_name}_id FROM {table_name};
                """)
            print(f'client succsessfully added: {table_name}_id is {cur.fetchone()[0]}')


def add_phone(connection, table_name: str, client_id: int, phone: str):
    with connection:
        with connection.cursor() as cur:
            cur.execute(f"""
                    INSERT INTO {table_name}(client_id, phone)
                    VALUES ({client_id}, {phone});
                """)
            connection.commit()
            cur.execute(f"""
                    SELECT first_name, last_name, phone FROM {table_name}
                    JOIN client USING(client_id);
                """)
            res = cur.fetchmany()[0]
            print(f'phone succsessfully added: {res[0]} {res[1]} phone is {res[2]}')


def change_data(connection, table_name: str, client_id: int, **info):
    with connection:
        with connection.cursor() as cur:
            for column, data in info.items():
                cur.execute(f"""
                        UPDATE {table_name} SET {column} = {data}
                        WHERE client_id = {client_id};
                    """)
                connection.commit()
                cur.execute(f"""
                        SELECT * FROM {table_name}
                        WHERE client_id = {client_id};
                    """)
                res = cur.fetchmany()[0]
            print(f'changes succsessfully added: client {res[0]} updated')


def delete_phone(connection, table_name: str, client_id: int, phone: str):
    with connection:
        with connection.cursor() as cur:
            cur.execute(f"""
                    DELETE FROM {table_name}
                    WHERE client_id = {client_id} AND phone = {phone};
                """)
            connection.commit()
            print(f'phone succsessfully deleted')


def delete_client(connection, table_name: str, client_id: int):
    with connection:
        with connection.cursor() as cur:
            cur.execute(f"""
                    DELETE FROM {table_name}
                    WHERE client_id = {client_id};
                """)
            connection.commit()
            print(f'client succsessfully deleted')


def find_client(connection, **info):
    with connection:
        with connection.cursor() as cur:
            for column, data in info.items():
                cur.execute(f"""
                        SELECT client_id, first_name, last_name, e_mail, phone FROM client
                        JOIN phone USING(client_id)
                        WHERE {column} = '{data}'
                    """)
                res = cur.fetchall()
                if res:
                    print(f'client succsessfully found: {res}')
                else:
                    print('client not found:(')


if __name__ == '__main__':
    con = psycopg2.connect(database="clients", user="postgres", password="postgres")
    create_table(con, 'client', first_name='VARCHAR(100)', last_name='VARCHAR(100)', e_mail='VARCHAR(100)')
    create_table(con, 'phone', client_id='INTEGER REFERENCES client(client_id)', phone='VARCHAR(100)')
    add_client(con, 'client', first_name="'Sergey'", last_name="'Sobyanin'", e_mail="'kladu_plitku@mos.ru'")
    add_phone(con, 'phone', 1, '89998887766')
    change_data(con, 'client', 1, first_name="'Vicktor'", last_name="'Yanukovich'", e_mail="'kaifarik@lol.ua'")
    delete_phone(con, 'phone', 1, "'89998887766'")
    delete_client(con, 'client', 1)
    find_client(con, phone='89998887766')
