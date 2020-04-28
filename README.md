### Shiny Citations Example

This Shiny app automatically figures out which packages you have loaded and converts them to a nice-looking HTML works cited list.

It works using R's built-in `.packages() `, `citation()`, and `format()` functions.

Working with HTML in Shiny can be tricky, and therefore it's difficult to make readable, clickable citations lists.  This app does it automatically and the code behind it is easy to insert into your own app.  Simply copy `uiOutput(outputId = "workscited")` into your `ui.R` or the UI portion of your `app.R` where you want the list to go (an "about" tab is a nice place), then copy everything from the `server()` function into the bottom of your `server.R` or the server portion of your `app.R`.

As a word of caution: this script will return all packages loaded in your library.  For the most accurate list of citations, restart your R session before running your app locally.
