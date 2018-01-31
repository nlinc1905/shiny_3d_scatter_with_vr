library(shiny)
library(plotly)

function(input, output, session) {
  
  output$plotlyscatter <- renderPlotly({
    plot_ly(d, x=d[,input$xaxis], y=d[,input$yaxis], z=d[,input$zaxis], color=d[,input$color],
            width=1000, height=600) %>%
      add_markers() %>%
      layout(scene = list(xaxis=list(title=input$xaxis),
                          yaxis=list(title=input$yaxis),
                          zaxis=list(title=input$zaxis)))
  })
  
  output$aframescatter <- renderUI({
    h <- paste(readLines('iris_scatter.html'), collapse='\n')
    h <- gsub('x="Sepal.Length"', paste0('x="', input$xaxis, '"'), h)
    h <- gsub('y="Sepal.Width"', paste0('y="', input$yaxis, '"'), h)
    h <- gsub('z="Petal.Length"', paste0('z="', input$zaxis, '"'), h)
    h <- gsub('xlabel="Sepal.Length"', paste0('xlabel="', input$xaxis, '"'), h)
    h <- gsub('ylabel="Sepal.Width"', paste0('ylabel="', input$yaxis, '"'), h)
    h <- gsub('zlabel="Petal.Length"', paste0('zlabel="', input$zaxis, '"'), h)
	if (input$color!="Species") {
      h <- gsub('val="Species.Nbr"', paste0('val="', input$color, '"'), h)
    }
    HTML(paste(h))
  })
  
}
