

# ui.R

library(shiny)
library(shinythemes)


fig.width <- 600
fig.height <- 450


shinyUI(fluidPage(theme =  shinytheme("cerulean"),
 titlePanel("Linear Regression Model"),
 #list(tags$head(tags$style("body {background-color: gray; }"))),
 sidebarLayout(
   sidebarPanel(
    
     # sidepbar panel has the Input
     h4("Note that"),
     h4("the input data set shuold contain",
        "predictor (X) in fisrt column and outcome (Y) in second column",style = "font-family: 'times'; font-si16pt"),
     helpText("the type of file you upload should be .csv or .txt",style = "font-family: 'times'; font-si16pt"),
     
     br(),
    # Check box for selection of header and type of file option
    checkboxInput('header','Header', value = T),
    
    br(),
    radioButtons('sep', 'separator', c(comma = ',', semicolon = ';', tab = '\t'), selected = NULL, inline = FALSE),
    br(),

   # take the file from user
   fileInput('data', 'Choose file to upload', multiple = FALSE, accept = c('.text/ comma-separated-values',
                                                                           '.csv',
                                                                           '.xlsx',
                                                                           '.txt',
                                                                           '.text/ tab-separated-values')),
  
   
   
   numericInput("obs", "Observations:", 20,
                min = 1, max = 10000),
   
   

   br(),
wellPanel(
  h5("Team Netcloud")
 
),
   br(),br(),br(),br()
   ),
  
   
   mainPanel(
     tabsetPanel(
       
       tabPanel("Table", tableOutput("table")),
       tabPanel("Plot", plotOutput("plot")),
       tabPanel("Linear Regression", plotOutput("LinearPlot")),
       tabPanel("Summary", verbatimTextOutput("summary")),
       tabPanel("Linear Regression Summary", verbatimTextOutput("Linearsummary"))
     )
   )
   
   )  
)
)