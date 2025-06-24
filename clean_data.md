# Cleaning data

The `employees2.csv` dataset:

- **50 rows** and **10 columns**: `id`, `first_name`, `last_name`, `email`, `age`, `gender`, `city`, `join_date`, `salary`, `department`.

  
- **Issues for Data Wrangler practice**:
  - **Missing values**: E.g., `first_name` in row 5, `last_name` in row 2, `age` in rows 2, 7, 12, 28.
  - **Duplicate rows**: E.g., rows 1, 3, 31 are identical; rows 1 and 23 share some fields (same email, different names).
  - **Inconsistent formatting**: E.g., `join_date` has mixed formats (e.g., "2020-01-15" vs. "2021-03,20"); emails with commas (e.g., "male@email.com,").
  - **Typographical errors**: E.g., `email` in row 22 has a comma; `department` has inconsistent casing (e.g., "Customer Support" vs. "Engineering").
  - **Invalid data**: E.g., missing `city` in row 27.

- Suitable for practicing cleaning, deduplication, imputation, and formatting in Data Wrangler.

## Steps to Fix the Dataset Using Data Wrangler in VS Code

1. **Install and Set Up Data Wrangler**:
   - Ensure the Data Wrangler extension is installed in VS Code (available from the Extensions Marketplace).
   - Open the CSV file (`test_data_50rows.csv`) in VS Code. Data Wrangler should detect it and offer to open it in the Data Viewer.

2. **Remove Duplicate Rows**:
   - In Data Wrangler, use the "Remove Duplicates" operation.
   - Select all columns (e.g., `id`, `first_name`, `last_name`, `email`, etc.) to identify exact duplicates (e.g., rows 1, 3, 31 are identical).
   - Apply the operation to remove duplicates, keeping the first occurrence.

3. **Handle Missing Values**:
   - **Missing `first_name` and `last_name`**:
     - Filter rows with missing `first_name` (e.g., row 5) or `last_name` (e.g., row 2).
     - Use "Fill Missing" to impute with a placeholder (e.g., "Unknown") or use a rule-based approach (e.g., derive from `email` if possible).
   - **Missing `age`**:
     - For rows with missing `age` (e.g., rows 2, 7, 12, 28), impute with the mean or median age of the dataset.
     - Use the "Group By" operation on `department` to calculate mean `age` per department for more context-aware imputation.
   - **Missing `city`**:
     - For rows with missing `city` (e.g., row 27), impute with a default value (e.g., "Unknown") or mode based on `department`.

4. **Fix Inconsistent Formatting**:
   - **Inconsistent `join_date`**:
     - Standardize `join_date` to a consistent format (e.g., `YYYY-MM-DD`).
     - Use Data Wrangler's "Format Date" operation to convert dates like "2021-03,20" to "2021-03-20".
   - **Inconsistent `email`**:
     - Remove erroneous commas in emails (e.g., "male@email.com," in row 22).
     - Use the "Replace" operation to strip commas or other invalid characters.
   - **Inconsistent `department` casing**:
     - Use the "Transform" operation to standardize `department` values to title case (e.g., "Customer Support" and "customer support" to "Customer Support").

5. **Handle Typographical Errors**:
   - For emails with invalid formats (e.g., "male@email.com,"), use a regular expression in Data Wrangler to validate and clean email formats.
   - For `department`, ensure consistency by mapping similar values (e.g., "CustomerSupport" to "Customer Support") using a replace or mapping operation.

6. **Validate and Correct Invalid Data**:
   - Check for invalid `age` values (e.g., negative or unrealistic ages, though none in this dataset).
   - Validate `salary` for outliers (e.g., extremely low or high values) and decide whether to cap or flag them.
   - Ensure `id` is unique; if duplicates remain after step 2, flag or reassign IDs.

7. **Export the Cleaned Data**:
   - Once all operations are applied, export the cleaned dataset as a new CSV file using Data Wrangler’s "Export to CSV" option.
   - Alternatively, export the generated Python code from Data Wrangler to automate the process.

8. **Review and Iterate**:
   - Inspect the cleaned dataset in the Data Viewer to ensure all issues are resolved.
   - If new issues are identified (e.g., additional inconsistencies), repeat relevant steps.




## Python Code to Automate Cleaning

Below is a Python script using `pandas` to perform the same cleaning tasks  
programmatically. This script mirrors the steps above and can be used independently  
or as a follow-up to Data Wrangler’s generated code.


```python
import pandas as pd
import numpy as np
from datetime import datetime

# Load the CSV file
df = pd.read_csv('test_data_50rows.csv')

# Step 1: Remove duplicate rows
df = df.drop_duplicates(keep='first')

# Step 2: Handle missing values
# Impute missing first_name and last_name with 'Unknown'
df['first_name'] = df['first_name'].fillna('Unknown')
df['last_name'] = df['last_name'].fillna('Unknown')

# Impute missing age with mean age per department
df['age'] = df.groupby('department')['age'].transform(lambda x: x.fillna(x.mean().round()))

# Impute missing city with 'Unknown'
df['city'] = df['city'].fillna('Unknown')

# Step 3: Fix inconsistent formatting
# Standardize join_date to YYYY-MM-DD
def standardize_date(date_str):
    try:
        # Handle formats like "2021-03,20"
        if isinstance(date_str, str):
            date_str = date_str.replace(',', '-')
            return pd.to_datetime(date_str, errors='coerce').strftime('%Y-%m-%d')
        return date_str
    except:
        return np.nan

df['join_date'] = df['join_date'].apply(standardize_date)

# Clean email (remove trailing commas or invalid characters)
df['email'] = df['email'].str.replace(r'[,]+$', '', regex=True)

# Standardize department to title case
df['department'] = df['department'].str.title()

# Step 4: Handle typographical errors
# Ensure email format is valid (basic check)
df['email'] = df['email'].str.strip().str.lower()

# Step 5: Validate data
# Ensure id is unique (reassign if necessary)
df['id'] = range(1, len(df) + 1)

# Check for invalid salary (e.g., negative or zero)
df.loc[df['salary'] <= 0, 'salary'] = df['salary'].mean()

# Step 6: Save the cleaned dataset
df.to_csv('cleaned_test_data.csv', index=False)

# Display the first few rows to verify
print(df.head())
```


You can also use Data Wrangler to perform these steps interactively and export similar Python code, 
then compare it with the provided script. 
