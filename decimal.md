# Decimal 

High-precision calculation in Python with `Decimal` type. The type is  
located in the `decimal` module. 

The Python decimal module provides support for fast correctly-rounded  
decimal floating point arithmetic. 

By default, Python interprets any number that includes a decimal point  
as a double precision floating point number. The Decimal is a floating  
decimal point type which more precision and a smaller range than the float.  
It is appropriate for financial and monetary calculations. It is also  
closer to the way how humans work with numbers.  

Unlike hardware based binary floating point, the decimal module has  
a user alterable precision which can be as large as needed for  
a given problem. The default precision is 28 places. 

Some values cannot be exactly represented in a float data type.  
For instance, storing the 0.1 value in float (which is a binary floating point value)     
variable we get only an approximation of the value. Similarly, the 1/3 value  
cannot be represented exactly in decimal floating point type. 

## Default precision 

The Decimal has a default precision of 28 places, while the float has 18 places. 

```python
#!/usr/bin/python

from decimal import Decimal

x = 1 / 3
print(type(x))
print(x)

print("-----------------------")

y = Decimal(1) / Decimal(3)
print(type(y))
print(y)
```
