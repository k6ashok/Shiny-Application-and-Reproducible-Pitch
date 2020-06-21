#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that calculates the loan repayment instalment given the loan,
# term and the rate of interest.
ui <- fluidPage(
    
    # Application title
    titlePanel("Loan calculator"),
    
    # Sidebar with a slider input for amount of loan
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "loan",
                         "Amount of loan",
                         min = 1000,
                         max = 100000,
                         value = 10000,
                         step = 1000),
            numericInput(inputId = "term", 
                         "Loan term(years)", 
                         value = 2,
                         min = 1,
                         max = 10, 
                         step = 1),
            numericInput(inputId = "interest",
                         "Annual Rate of interest(%)",
                         value = 5,
                         min = 1,
                         max = 100,
                         step = 0.25),
            radioButtons(inputId = "freq",
                         "Frequency of repayment",
                         choices = c("Weekly","Monthly","Quarterly","Half yearly","Annually"),
                         inline = FALSE,
            )
            
        ),
        
        # Display the amount of instalmment repayment
        mainPanel(h3("Amount of repayment instalment"),
                  textOutput("outputId", 
                             container = span, 
                             inline = TRUE)
        )
    ))
