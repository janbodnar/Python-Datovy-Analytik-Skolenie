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
