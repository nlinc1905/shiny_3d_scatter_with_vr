library(shiny)
library(plotly)

fluidPage(
  #Import files from www directory
  tags$head(
    tags$script(src="https://aframe.io/releases/0.5.0/aframe.min.js"),
    tags$script(src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.4.1/d3.min.js"),
    tags$script(src="https://cdn.rawgit.com/zcanter/aframe-scatterplot/master/dist/a-scatterplot.min.js")
  ),
  
  titlePanel("Iris Dataset Visualization"),
  
  sidebarLayout(
    #Sidebar
    sidebarPanel(
      selectInput("xaxis", "x-axis", choices=numeric_columns, selected='Sepal.Length'),
      selectInput("yaxis", "y-axis", choices=numeric_columns, selected='Sepal.Width'),
      selectInput("zaxis", "z-axis", choices=numeric_columns, selected='Petal.Length'),
      selectInput("color", "color", choices=colnames(d), selected='Species')
    ),
    
    #Main
    mainPanel(
      tabsetPanel(
        tabPanel('View in Plotly', plotlyOutput('plotlyscatter')),
        tabPanel('View in VR', tags$div(id='vrscatter', 
                                        uiOutput('aframescatter')))
                                        #includeHTML('iris_scatter.html')))
      )
    )
  )
)
