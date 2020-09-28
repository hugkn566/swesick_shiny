#app.r
ui <- fluidPage(
  titlePanel("Quarterly ongoing illnesses in Sweden"),
  sidebarLayout(
    sidebarPanel("test"),
    mainPanel("TEST",
              fluidRow(
                column(12,
                       dataTableOutput("table")))
    )
  ),
  tags$head(tags$style("tfoot {display: table-header-group;}"))
)

server <- function(input, output){
  
  
  output$table <- renderDataTable(swesick())
}

shinyApp(ui, server)
