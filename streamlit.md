# Streamlit 

Streamlit is an open-source Python library specifically designed for creating interactive and  
visually appealing web applications for machine learning and data science projects. It simplifies  
the process of turning data scripts into shareable web applications with minimal effort.

## Key Features
- **Ease of Use**: Streamlit is known for its simplicity and ease of use. You  
  can create web applications with just a few lines of Python code.  
- **Interactive Widgets**: It provides a variety of widgets (like sliders,  
  buttons, and text inputs) to create interactive applications.  
- **Real-time Updates**: Applications built with Streamlit can update in  
  real-time, which is especially useful for displaying dynamic data.  
- **Integration**: Streamlit integrates seamlessly with popular data science and  
  machine learning libraries such as Pandas, NumPy, Matplotlib, and  
  Scikit-learn.

## Common Uses
- *Data Visualization*: Creating interactive dashboards and visualizations to  
  explore and share data insights.  
- *Machine Learning*: Developing and sharing machine learning models with  
  real-time predictions.  
- *Exploratory Data Analysis (EDA)*: Building applications to interactively
  explore datasets.  
- *Prototyping*: Quickly prototyping data-driven applications without needing  
  extensive web development skills.  

## Dashboard

A *dashboard* is a graphical user interface (GUI) that displays key  
performance indicators (KPIs) and other relevant information at a glance. It  
consolidates and organizes data in a way that is easy to read, interpret, and  
interact with. Dashboards are used across various fields to monitor metrics,  
track progress, and make data-driven decisions.  

## Key Features
- *Visual Representation*: Dashboards use charts, graphs, and other visual  
  elements to represent data, making it easier to understand trends and  
  patterns.  
- *Real-time Data*: Many dashboards display real-time data, providing  
  up-to-date information for timely decision-making.  
- *Interactive Elements*: Users can often interact with dashboards through  
  filters, drill-downs, and other interactive features to explore data in more  
  detail.  
- *Customization*: Dashboards can be customized to show specific metrics and  
  KPIs relevant to the user or organization.  

## Common Uses
- *Business Intelligence*: Monitoring business metrics such as sales  
  performance, customer engagement, and financial health.  
- *Operations*: Tracking operational metrics like production efficiency,  
  inventory levels, and supply chain performance.  
- *Marketing*: Analyzing marketing campaign performance, website traffic, and  
  social media metrics.  
- *Healthcare*: Monitoring patient health metrics, hospital performance, and   
  resource utilization.  


Streamlit appications are run with `streamlit run main.py`  


## Message

```python
import streamlit as st

st.write("My first streamlit application")
```

## Text input 

The example demonstrates the basic use of a text input widget combined with  
conditional content display. Streamlit's reactivity ensures that the app dynamically  
updates in real time. When you type your name into the text input box, Streamlit immediately  
reacts to this input and updates the display.

In Streamlit, *reactivity* refers to the application's ability to automatically update  
and display changes in real time based on user interactions, without the need for manual  
refreshes or reloading. When a user changes an input, such as entering text, adjusting  
a slider, or clicking a button, Streamlit immediately processes this change and updates  
the output dynamically. This feature enhances the interactivity and responsiveness  
of the application, creating a smooth user experience.


```python
import streamlit as st

st.title('Text input')

name = st.text_input('Enter your name:')

if name:
    st.write(f'Hello {name}!')
```

## Data table 

```python
import streamlit as st
import pandas as pd

df = pd.read_csv('products.csv')

# Display title and description
st.title('Data Dashboard')
st.write('This is a simple data dashboard using Streamlit.')

# use table to display data
st.table(df.head(15))
```

## Button 

Streamlit reruns the script from the beginning on every user interaction, such as clicking a button.  
The `st.write` method updates the displayed content based on the script's current state and conditions.  

```python
import streamlit as st

# Title of the app
st.title('Simple Button Example')

# Create a button
if st.button('Click Me'):
    st.write('Button clicked!')
else:
    st.write('Button not clicked.')
```

---

Random numbers 

```python
import streamlit as st
import numpy as np

st.title('Generate Random Numbers')

if st.button('Generate Random Numbers'):
    random_numbers = np.random.randint(0, 100, size=10)
    st.write('Random Numbers:', random_numbers)
else:
    st.write('Click to generate random numbers')
```

--- 

Show/hide dataframe

```python
import streamlit as st
import pandas as pd

st.title('Button to Display/Hide DataFrame')

# Create two buttons
show_button = st.button('Show DataFrame')
hide_button = st.button('Hide DataFrame')

# Sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'Occupation': ['Engineer', 'Doctor', 'Artist']
}
df = pd.DataFrame(data)

# Logic to display or hide DataFrame based on button clicks
if show_button:
    st.write(df)
elif hide_button:
    st.write('DataFrame hidden.')
else:
    st.write('Click  to display/hide the DataFrame.')
```

## Select box

```python
import streamlit as st

st.write("Sidebar Example")
selection = st.selectbox('Choose a number:', [1, 2, 3, 4, 5])
st.write(f'Selected number: {selection}')
```

## Text input &  slider

```python
import streamlit as st

st.title('Text input and slider')

# Text input
name = st.text_input('Enter your name:')

# Slider
age = st.slider('Select your age:', 0, 100, 25)

# Button
if st.button('Submit'):
    st.write(f'Hello {name}, you are {age} years old!')
```



## Line chart

```python
import streamlit as st
import pandas as pd
import numpy as np

st.title('Line chart example')

# Generate random data
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['a', 'b', 'c']
)

# Display line chart
st.line_chart(chart_data)
```

## Bar chart 

```python
import streamlit as st
import pandas as pd
import numpy as np

# Generate example data
data = {
    'Category': ['A', 'B', 'C', 'D'],
    'Total Sales': [100, 150, 200, 250]
}

df = pd.DataFrame(data)

# Title of the app
st.title('Bar Chart Example')

# Display the bar chart
st.bar_chart(df.set_index('Category'))
```

## Area chart 

```python
import streamlit as st
import pandas as pd
import numpy as np

# Generate example data
data = np.random.randn(20, 3)
df = pd.DataFrame(data, columns=['a', 'b', 'c'])

# Display the area chart
st.area_chart(df)
```

## Map chart 

```python
import streamlit as st
import pandas as pd
import numpy as np

# Generate example data
data = pd.DataFrame({
    'lat': np.random.uniform(-90, 90, 100),
    'lon': np.random.uniform(-180, 180, 100)
})

# Display the map
st.map(data)
```

## Histogram with Matplotlib

```python
import streamlit as st
import matplotlib.pyplot as plt
import numpy as np

# Generate example data
data = np.random.randn(1000)

# Create a Matplotlib figure
fig, ax = plt.subplots()
ax.hist(data, bins=30, edgecolor='black')
ax.set_xlabel('Value')
ax.set_ylabel('Frequency')
ax.set_title('Histogram Example')

# Display the chart using Streamlit
st.title('Histogram Example')
st.pyplot(fig)
```

## Scatter plot with Matplotlib

```python
import streamlit as st
import matplotlib.pyplot as plt
import numpy as np

# Generate example data
x = np.random.rand(100)
y = np.random.rand(100)

# Create a Matplotlib figure
fig, ax = plt.subplots()
ax.scatter(x, y, c='blue', alpha=0.5)
ax.set_xlabel('X-axis')
ax.set_ylabel('Y-axis')
ax.set_title('Scatter Plot Example')

# Display the chart using Streamlit
st.title('Scatter Plot Example')
st.pyplot(fig)
```


## Pie chart with Plotly

```python
import streamlit as st
import plotly.express as px
import pandas as pd
import numpy as np

# Generate example data
data = {
    'Category': ['A', 'B', 'C', 'D'],
    'Quantity': [10, 20, 30, 40]
}

df = pd.DataFrame(data)

# Title of the app
st.title('Pie Chart Example')

# Create a pie chart
fig = px.pie(df, values='Quantity', names='Category', title='Quantity by Category')

# Display the pie chart using Streamlit
st.plotly_chart(fig)
```



## Upload a file

CSV file:  

```python
import streamlit as st
import pandas as pd

st.title('Upload CSV file')

# File uploader
uploaded_file = st.file_uploader('Choose a CSV file', type='csv')

if uploaded_file is not None:
    # Read the uploaded file
    df = pd.read_csv(uploaded_file)
    
    # Display the DataFrame
    st.write('Uploaded DataFrame:')
    st.write(df)
```

Excel file:  

```python
import streamlit as st
import pandas as pd

# Title of the app
st.title('Excel File Upload Example')

# File uploader
uploaded_file = st.file_uploader('Choose an Excel file', type=['xlsx', 'xls'])

if uploaded_file is not None:
    # Read the uploaded Excel file
    df = pd.read_excel(uploaded_file)
    
    # Display the DataFrame
    st.write('Uploaded Excel File Data:')
    st.write(df)
```


## Sidebar 

A sidebar is an optional component that provides a dedicated space on the side of  
the app's main content area for placing widgets, text, and other elements. This allows  
for better organization and easy access to controls and information, without cluttering  
the main interface. You can add elements to the sidebar using `st.sidebar`, which works  
similarly to the main st functions.

Using a sidebar helps keep your application clean and intuitive, ensuring a great user experience.  

```python
import streamlit as st

# Title of the app
st.title('Sidebar Widgets')

# Sidebar with a slider and text input
sidebar = st.sidebar
slider_value = sidebar.slider('Select a value:', 0, 100, 50)
text_input = sidebar.text_input('Enter a message:')

# Display the slider and text input values
st.write(f'Slider Value: {slider_value}')
st.write(f'Message: {text_input}')
```

## Two columns

```python
import streamlit as st
import numpy as np
import pandas as pd

st.title('Two columns')

# Refresh button
if st.button('Refresh Data'):
    st.rerun()

# Create two columns
left_column, right_column = st.columns(2)

# Generate random data for the left column
dataframe = np.random.randn(10, 20)
left_column.dataframe(dataframe)

# Generate random data for the right column
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['a', 'b', 'c']
)
right_column.line_chart(chart_data)
```

## Markdown

```python
import streamlit as st
import pandas as pd

# Title of the app
st.title('Streamlit markdown')

# Display a simple DataFrame
df = pd.DataFrame({
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'Occupation': ['Engineer', 'Doctor', 'Artist']
})

st.write('Simple DataFrame:')
st.write(df)

# Display some markdown text
st.markdown('This is **Streamlit**. You can write *markdown* too!')

st.markdown('Python *source code*')

st.markdown('''
~~~python
import streamlit as st
import pandas as pd

# Title of the app
st.title('Streamlit markdown')

# Display a simple DataFrame
df = pd.DataFrame({
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'Occupation': ['Engineer', 'Doctor', 'Artist']
})

st.write('Here is a simple DataFrame:')
st.write(df)

# Display some markdown text
st.markdown('This is **Streamlit**. You can write *markdown* too!')
~~~ ''')
```

## Interactive example

```python
import streamlit as st
import pandas as pd

st.title('Load CSV Data from URL')

# Create a text input box for the URL
csv_url = st.text_input('Enter the URL of a CSV file:')

# Create a button to load the data
if st.button('Load Data'):
    if csv_url:
        try:
            # Load the CSV data into a DataFrame
            df = pd.read_csv(csv_url)
            # Store the DataFrame in session state
            st.session_state.df = df
        except Exception as e:
            st.write(f'Error loading data: {e}')
    else:
        st.write('Please enter a valid URL.')

# Check if DataFrame is stored in session state
if 'df' in st.session_state:
    # Create a slider to control the number of rows displayed
    num_rows = st.slider('Select number of rows to display', 
                          min_value=1, 
                          max_value=len(st.session_state.df), 
                          value=10, 
                          key='num_rows_slider')

    # Display the DataFrame with the selected number of rows and specified width
    st.dataframe(st.session_state.df.head(num_rows), width=800)
```


