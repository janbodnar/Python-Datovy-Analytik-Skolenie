# Large data



* Efficient Data Storage Formats
Parquet and HDF5: These formats are optimized for performance and can handle   
large datasets more efficiently than traditional CSV files.  

* Utilizing Efficient Libraries:
  - `Dask`: This library extends pandas and NumPy functionalities to support parallel  
    computing, enabling operations on datasets that don't fit into memory.  
  - `Vaex`: Vaex is optimized for memory-mapped data, enabling out-of-core operations  
    on large datasets without loading the entire dataset into memory.  

* Data Processing Techniques:
  - Chunking: Processing data in smaller chunks can help manage memory usage effectively.    
  - Vectorization: Leveraging vectorized operations with libraries like NumPy can  
    significantly speed up data processing.  

* Leveraging Databases:
  SQL Databases: Storing large datasets in databases and querying only the necessary  
  data can reduce memory load.   

* Memory Optimization
  Data Types: Optimize memory usage by specifying appropriate data types  
  for your DataFrame columns.   

* Lazy Evaluation: Libraries like Dask and Vaex use lazy evaluation to defer computation  
  until necessary, saving memory and computational resources.


## Examples

```python
import dask.dataframe as dd

# Load a large CSV file into a Dask DataFrame
df = dd.read_csv('large_dataset.csv')

# Perform computations on the DataFrame
result = df[df['column'] > value].mean().compute()

print(result)
```

## Using parquet

```python
import pandas as pd

# Reading a Parquet file
df = pd.read_parquet('large_dataset.parquet')

# Writing to a Parquet file
df.to_parquet('output_dataset.parquet')

# Display the first few rows
print(df.head())
```

## Reading CSV in chunks

```python
import pandas as pd

chunk_size = 10000  # Number of rows per chunk
chunks = []

for chunk in pd.read_csv('large_dataset.csv', chunksize=chunk_size):
    # Perform some operation on each chunk
    chunk_result = chunk[chunk['column'] > value]
    chunks.append(chunk_result)

# Concatenate all chunks
final_result = pd.concat(chunks)
print(final_result)
```

## Parallel and Distributed Computing

Using Multiprocessing

```python
import multiprocessing as mp
import pandas as pd

def process_chunk(chunk):
    # Perform some operation on the chunk
    return chunk[chunk['column'] > value]

# Read the CSV in chunks and process in parallel
chunk_size = 10000
with mp.Pool(mp.cpu_count()) as pool:
    chunks = pd.read_csv('large_dataset.csv', chunksize=chunk_size)
    results = pool.map(process_chunk, chunks)

# Combine results
final_result = pd.concat(results)
print(final_result)
```

## Optimization

Optimizing data types in Pandas is crucial for improving performance and reducing memory usage,  
especially when working with large datasets. By default, Pandas infers data types, but sometimes   
it uses more memory than necessary. By explicitly specifying data types, you can save memory and  
speed up operations.

Explanation:

 - Integer Columns: Use smaller integer types (e.g., int8, int16, int32, int64) based on the 
   range of values in the column.
 - Floating-Point Columns: Use smaller floating-point types (e.g., float32 instead of float64)  
   if precision is not critical.
 - Categorical Columns: Convert columns with a limited number of unique values to the  
   category data type.

```python
import pandas as pd
import numpy as np

# Create a sample dataset
data = {
    'int_column': np.random.randint(0, 100, size=1000000),
    'float_column': np.random.rand(1000000),
    'category_column': np.random.choice(['A', 'B', 'C', 'D'], size=1000000)
}

df_default = pd.DataFrame(data)

# Save the DataFrame to a CSV file
df_default.to_csv('sample_data.csv', index=False)
print("sample_data.csv has been generated successfully!")



dtype = {
    'int_column': 'int32',
    'float_column': 'float32',
    'category_column': 'category'
}
df_optimized = pd.read_csv('sample_data.csv', dtype=dtype)


# Memory usage with default data types
memory_default = df_default.memory_usage(deep=True).sum()
print(f"Memory usage with default data types: {memory_default / 1024 ** 2:.2f} MB")

# Memory usage with optimized data types
memory_optimized = df_optimized.memory_usage(deep=True).sum()
print(f"Memory usage with optimized data types: {memory_optimized / 1024 ** 2:.2f} MB")
```

```
py main.py
sample_data.csv has been generated successfully!
Memory usage with default data types: 59.13 MB
Memory usage with optimized data types: 8.58 MB
```

## Lazy evaluation

Lazy evaluation allows computations to be delayed until their results are needed, which can   
save time and memory in certain situations. I'll create two Python examples: one with lazy   
evaluation and one without. We will then use the cProfile module to compare the performance.  

No lazy:

```python
import cProfile
import pstats

def calculate_squares(numbers):
    result = []
    for n in numbers:
        result.append(n * n)
    return result

def main():
    numbers = range(1, 3_000_000)
    squares = calculate_squares(numbers)
    # Simulate doing something with the squares
    total = sum(squares)
    print(total)

if __name__ == "__main__":
    profiler = cProfile.Profile()
    profiler.enable()
    main()
    profiler.disable()
    stats = pstats.Stats(profiler).sort_stats('cumulative')
    stats.print_stats()
```


Lazy:  

```python
import cProfile
import pstats

def lazy_calculate_squares(numbers):
    for n in numbers:
        yield n * n

def main():
    numbers = range(1, 3_000_000)
    squares = lazy_calculate_squares(numbers)
    # Simulate doing something with the squares
    total = sum(squares)
    print(total)

if __name__ == "__main__":
    profiler = cProfile.Profile()
    profiler.enable()
    main()
    profiler.disable()
    stats = pstats.Stats(profiler).sort_stats('cumulative')
    stats.print_stats()
```

## yield 

The `yield` keyword in Python is used to create a generator. Generators are special functions   
that return an iterator, which can be iterated over one value at a time. Unlike a standard   
function that returns a single value and exits, a generator can yield multiple values, pausing   
its state between each yield and resuming where it left off when the next value is requested.

Here's a simple example to illustrate the use of `yield`:

```python
def simple_generator():
    yield 1
    yield 2
    yield 3

# Create a generator object
gen = simple_generator()

# Iterate through the generator
for value in gen:
    print(value)
```

In this example, the generator function `simple_generator` yields values 1, 2, and 3 one by one.   
When we create the generator object `gen` and iterate through it, the function is paused at each  
`yield` statement, and the yielded value is returned. When the next value is requested, the function  
resumes execution from where it left off.

### Advantages of Using `yield`
* **Memory Efficiency**: Generators only produce one item at a time, on-the-fly, instead of generating  
   and storing an entire list in memory. This can be a significant advantage when dealing with large datasets.  
* **Improved Performance**: Since values are generated as needed, the initial computation can be faster,  
  and you avoid the overhead of creating and storing an entire list.  
* **Lazy Evaluation**: Values are computed only when they are needed, allowing for more efficient use of resources.  
  This can lead to performance improvements, especially in scenarios where not all values are needed or  
  if the computation is expensive.  

To put it into context with our previous example:

### Without Lazy Evaluation

```python
def calculate_squares(numbers):
    result = []
    for n in numbers:
        result.append(n * n)
    return result
```

In this case, all the squares are computed and stored in memory at once. For large datasets,  
this can be inefficient both in terms of time and memory usage.  

### With Lazy Evaluation
```python
def lazy_calculate_squares(numbers):
    for n in numbers:
        yield n * n
```

Here, the squares are generated one by one as they are needed. This approach is more  
memory-efficient and can lead to better performance, particularly when working with large datasets.

### Why It Is More Effective
- **Reduced Memory Usage**: Since values are generated on-the-fly, there's no need to  
  allocate memory for the entire list of values.
- **Better Performance**: By avoiding unnecessary computations and memory allocations,  
 generators can improve the overall performance of your program.
- **Scalability**: Generators can handle large datasets more gracefully since they do  
  not require the entire dataset to be loaded into memory at once.

In summary, using `yield` and generators can lead to more efficient and scalable code,   
particularly when dealing with large datasets or computations.


