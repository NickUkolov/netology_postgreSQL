import json
from configs import USER, PASSWORD, HOST, PORT
import sqlalchemy as sq
from sqlalchemy.orm import sessionmaker
from models import create_tables, Publisher, Shop, Book, Stock, Sale
import sqlalchemy_utils as squ


database_name = 'shops'
DSN = f'postgresql://{USER}:{PASSWORD}@{HOST}:{PORT}/{database_name}'
engine = sq.create_engine(DSN)
if not squ.database_exists(engine.url):
    squ.create_database(engine.url)
# else:
#     squ.drop_database(engine.url)
#     squ.create_database(engine.url)

Session = sessionmaker(bind=engine)
session = Session()

create_tables(engine)

with open('tests_data.json', 'r') as file:
    metadata = json.load(file)


def add_data(data):
    for record in data:
        model = {
            'publisher': Publisher,
            'shop': Shop,
            'book': Book,
            'stock': Stock,
            'sale': Sale,
        }[record.get('model')]
        session.add(model(id=record.get('pk'), **record.get('fields')))

    session.commit()



def find_publ(user_inp):
    if user_inp.isdigit():
        for c in session.query(Shop).join(Stock, Shop.id == Stock.id_shop). \
                join(Book, Stock.id_book == Book.id).join(Publisher, Book.id_publisher == Publisher.id). \
                filter(Publisher.id == user_inp).all():
            return c
    else:
        for c in session.query(Shop).join(Stock, Shop.id == Stock.id_shop). \
                join(Book, Stock.id_book == Book.id).join(Publisher, Book.id_publisher == Publisher.id). \
                filter(Publisher.name == user_inp).all():
            return c


session.close()

if __name__ == '__main__':
    add_data(metadata)
    user_input = input('Введите айди или имя писателя: ')
    print(find_publ(user_input))
