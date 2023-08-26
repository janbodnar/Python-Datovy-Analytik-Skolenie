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

## Comparing

Caution should be exercised when comparing floaing point values. While in many  
real world problems a small error is negligible, financial and monetary  
calculations must be exact.

```python
#!/usr/bin/python

from decimal import Decimal

x = 0.1 + 0.1 + 0.1

print(x == 0.3)
print(x)

print("----------------------")

x = Decimal('0.1') + Decimal('0.1') + Decimal('0.1')

print(x == Decimal('0.3'))
print(float(x) == 0.3)
print(x)
```

## Altering precision

We can change the default precision of the Decimal type.  
The mpmath module is a library for arbitrary-precision  
floating-point arithmetic.

`$ pip install mpmath`

we change the precision to 50 places. We compare the accuracy  
of the math.sqrt, Decimal's sqrt, and mpmath.sqrt functions. 

```python
#!/usr/bin/python

from decimal import Decimal, getcontext
import math

import mpmath

getcontext().prec = 50
mpmath.mp.dps = 50
num = Decimal(1) / Decimal(7)

num2 = mpmath.mpf(1) / mpmath.mpf(7)

print('   math.sqrt: {0}'.format(Decimal(math.sqrt(num))))
print('decimal.sqrt: {0}'.format(num.sqrt()))
print(' mpmath.sqrt: {0}'.format(mpmath.sqrt(num2)))
print('actual value: 0.3779644730092272272145165362341800608157513118689214')
```


