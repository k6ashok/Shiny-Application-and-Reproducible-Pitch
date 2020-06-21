#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to calculate the loan repayment instalment
server <- function(input, output) {
    
    output$outputId <- renderText({
        # Convert the interest rate to align with the frequency and calculate
        # the instalment repayment of loan
        frq <- ifelse(input$freq == "Weekly",52,ifelse(input$freq == "Monthly",12,
                                                 ifelse(input$freq == "Quarterly",4,
                                                        ifelse(input$freq == "Half yearly",2,1))))
        roi <- frq * ((1 + input$interest/100)^(1/frq)-1)
        v <- 1/(1+input$interest/100)
        outputId <- round((input$loan / (1- v^input$term) * roi)/frq,2)
        return(outputId)
        
        
        
        
        
    })
}
