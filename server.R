library(shiny)
library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      var <- input$variable
      hist(galton[var], xlab='height', col='blue',main='Histogram')
      mu <- input$mu
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((galton[var] - mu)^2)
      if (var == "child")
      {  
        text(63, 150, paste("mu = ", mu))
        text(63, 140, paste("MSE = ", round(mse, 2)))
      }
      else
      {
        text(65, 200, paste("mu = ", mu))
        text(65, 190, paste("MSE = ", round(mse, 2)))        
      }
    })
  }
)