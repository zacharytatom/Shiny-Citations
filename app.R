library(shiny)

ui <- fluidPage(

    # Application title ----
    titlePanel("Citations Generator Example"),
    
    # Horizontal line ----
    hr(),
    
    # Output the citation list ----
    uiOutput(outputId = "workscited")
)

server <- function(input, output) {

    # Create our citations list as a reactive element ----
    citations <- reactive({
        
        # Get actively loaded packages ----
        packageids <- (.packages())
        
        # Create an empty vector to be our list; length is 6 shorter than the
        # actual list of packages because that's how many base R citations it
        # would return ----
        citationslist <- vector(length = (length(packageids) - 6))
        
        # For loop runs through each package and grabs the actual citation ---
        for (i in 1:length(citationslist)) {
            
            # Add the citation for i in the html format ----
            citationslist[i] <- format(citation(packageids[i]), "html")
        }
        
        # Now we have to apply the HTML() function for Shiny to read the HTML
        # in the citations ----
        citationslist <- lapply(citationslist, HTML)
        
        # And return the object here ----
        return(citationslist)
        
    })
    
    # Render the citation list as a table ----
    output$workscited <- renderUI({
        
        # Call the reactive element ----
        citations()
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
