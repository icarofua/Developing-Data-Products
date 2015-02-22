#Write a shiny application with associated supporting documentation. 
#The documentation should be thought of as whatever a user will need to get started using your application.

#The application must include the following:
#You must also include enough documentation so that a novice user could use your application.
#The documentation should be at the Shiny website itself. Do not post to an external link.
#The Shiny application in question is entirely up to you. However, if you're having trouble coming up with 
#ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one 
#of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot 
#of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given 
#the short time frame.  

library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Galton's height data for parents and children prediction"),
    sidebarPanel(
      h6("The midparent's height is an average of the fathers height and 1.08 times the mother's. 
          In the data there are 205 different parents and 928 children. The data here is truncated at 
          the ends for both parents and children so that it can be treated as numeric data. The data 
          were tabulated and consequently made discrete. Below you can select the variable to show in the histogram.
         If you select the radiobutton child, the histogram shows the height the child and the frequency. Case you select
         the radiobutton parent, the histograms shows the midparent's height and the frequency. You can slide the values of mean
         and in this case it is showed the mu selected and the MSE respective."),
      radioButtons("variable", "Variable:",
                         c("child" = "child",
                           "parent" = "parent")),
      sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      plotOutput('newHist')
    )
  )
)