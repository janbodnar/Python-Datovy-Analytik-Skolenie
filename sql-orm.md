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


