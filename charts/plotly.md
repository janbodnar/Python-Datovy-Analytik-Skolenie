# Plotly


*Plotly* is an open-source graphing library that enables the creation of  
interactive, publication-quality graphs online. It's widely used in data  
analysis, data visualization, and machine learning to create detailed and  
interactive charts, dashboards, and plots.  

### Key Features:
1. *Interactivity*: Plotly plots are highly interactive, allowing users to  
   hover, zoom, and filter data points.  
2. *Integration*: Works seamlessly with popular data science languages like  
   Python, R, and JavaScript.  
3. *Versatility*: Supports a wide range of plot types, including line charts,  
   scatter plots, bar charts, heatmaps, 3D plots, and more.  
4. *Customizability*: Offers extensive customization options to tailor  
   visualizations to specific needs.  
5. *Ease of Use*: Provides user-friendly APIs that simplify the creation of  
   complex visualizations.  

### Common Usage:

1. *Data Visualization*:
   - Creating interactive line charts, bar charts, and scatter plots to analyze  
     trends and relationships.  
   - Generating 3D scatter plots and surface plots for multidimensional data  
     analysis.  

2. *Dashboards*:
   - Building dynamic and interactive dashboards to monitor business metrics,  
     scientific data, or personal projects.  
   - Using Dash, Plotly's web application framework, to combine Plotly graphs  
     with interactive controls.  

3. *Geographical Plots*:
   - Creating choropleth maps to visualize geographical data, such as population
     density or election results.  
   - Generating scatter plots on maps to show location-based data points.  

4. *Statistical Analysis*:  
   - Visualizing statistical data through histograms, box plots, and violin  
     plots to understand distributions.  
   - Creating heatmaps to identify correlations in datasets.   

5. *Machine Learning*:  
   - Plotting results of machine learning models, such as decision boundaries  
     and confusion matrices.  
   - Visualizing feature importance and model performance metrics.  

6. *Scientific Research*:  
   - Creating detailed plots for scientific publications and presentations.  
   - Sharing interactive visualizations with collaborators and the broader  
     scientific community.  

```python
import plotly.express as px
import pandas as pd

# Sample data
data = {'Year': [2010, 2011, 2012, 2013, 2014],
        'Sales': [100, 200, 300, 400, 500]}

# Create a DataFrame
df = pd.DataFrame(data)

# Create a line chart
fig = px.line(df, x='Year', y='Sales', title='Sales Over Time')

# Show the plot
fig.show()
```

