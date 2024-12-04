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


