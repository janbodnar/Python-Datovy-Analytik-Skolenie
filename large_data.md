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
