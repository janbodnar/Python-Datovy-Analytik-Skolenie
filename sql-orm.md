# SQLAlchemy

## Create table

```python
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base

eng = create_engine('sqlite:///:memory:')

Base = declarative_base()

class Car(Base):
    __tablename__ = "cars"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    price = Column(Integer)

Base.metadata.create_all(bind=eng)

Session = sessionmaker(bind=eng)
ses = Session()

ses.add_all(
   [Car(id=1, name='Audi', price=52642),
    Car(id=2, name='Mercedes', price=57127),
    Car(id=3, name='Skoda', price=9000),
    Car(id=4, name='Volvo', price=29000),
    Car(id=5, name='Bentley', price=350000),
    Car(id=6, name='Citroen', price=21000),
    Car(id=7, name='Hummer', price=41400),
    Car(id=8, name='Volkswagen', price=21600)])

ses.commit()

rs = ses.query(Car).all()

for car in rs:
    print(car.name, car.price)
```

## Add car 

```python
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base

eng = create_engine('sqlite:///test.db')

Base = declarative_base()
 
class Car(Base):
    __tablename__ = "cars"
 
    id = Column(Integer, primary_key=True)
    name = Column(String)  
    price = Column(Integer)
        
Session = sessionmaker(bind=eng)
ses = Session()    

c1 = Car(name='Oldsmobile', price=23450)
ses.add(c1)
ses.commit()

rs = ses.query(Car).all()

for car in rs:
    print(car.name, car.price)
```

## Filter data 

```python
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base

eng = create_engine('sqlite:///test.db')

Base = declarative_base()
Base.metadata.bind = eng


class Car(Base):
    __tablename__ = "cars"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    price = Column(Integer)


Session = sessionmaker(bind=eng)
ses = Session()

rs = ses.query(Car).filter(Car.name.like('%en'))

for car in rs:
    print(car.name, car.price)
```

## Query IN

```python
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base

eng = create_engine('sqlite:///test.db')

Base = declarative_base()


class Car(Base):
    __tablename__ = "cars"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    price = Column(Integer)


Session = sessionmaker(bind=eng)
ses = Session()

rs = ses.query(Car).filter(Car.id.in_([2, 4, 6, 8]))

for car in rs:
    print(car.id, car.name, car.price)
```


## Many-to-Many

```python
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from sqlalchemy import Table, Text, Integer, ForeignKey, Column, create_engine
from sqlalchemy.orm import relationship, declarative_base

Base = declarative_base()

# Association table
association_table = Table('association', Base.metadata,
                          Column('author_id', Integer,
                                 ForeignKey('author.id')),
                          Column('book_id', Integer, ForeignKey('book.id'))
                          )


class Author(Base):
    __tablename__ = 'author'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    books = relationship(
        "Book",
        secondary=association_table,
        back_populates="authors")

    def __str__(self):
        return f'{self.id} {self.name}'

class Book(Base):
    __tablename__ = 'book'
    id = Column(Integer, primary_key=True)
    title = Column(Text)
    authors = relationship(
        "Author",
        secondary=association_table,
        back_populates="books")

    def __str__(self):
        return f'{self.id} {self.title}'

# Create engine
engine = create_engine('sqlite:///:memory:')

# Create all tables in the engine
Base.metadata.create_all(engine)

# Create a new session
Session = sessionmaker(bind=engine)
session = Session()

# Create some authors
author1 = Author(name='Author 1')
author2 = Author(name='Author 2')
author3 = Author(name='Author 3')

# Create some books
book1 = Book(title='Book 1')
book2 = Book(title='Book 2')

# Add books to authors
author1.books = [book1, book2]
author2.books = [book1]
author3.books = [book2]

# Add authors to the session
session.add(author1)
session.add(author2)
session.add(author3)

# Commit the session
session.commit()

# Query the database
for author in session.query(Author):
    print(f'Author: {author.name}')
    for book in author.books:
        print(f'Book: {book.title}')

print('-------------')

# Query the database
for book in session.query(Book):
    print(f'Book: {book.title}')
    for author in book.authors:
        print(f'Author: {author.name}')

print('-------------')

for author in session.query(Author):
    print(author)

print('-------------')

for book in session.query(Book):
    print(book)
```





