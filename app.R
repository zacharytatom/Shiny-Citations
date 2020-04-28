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
        
        # Create an empty vector to be our list
        citationslist <- vector(length = (length(packageids)))
        
        # Use lapply to grab citations from package IDs and format them in HTML ----
        citationslist <- lapply(lapply(packageids, citation), format, "html")
        
        # Next we remove duplicates in the list; base R packages all have the same
        # citation ----
        citationslist <- unique(citationslist)
        
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
