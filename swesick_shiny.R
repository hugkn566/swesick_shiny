#app.r
ui <- fluidPage(
  titlePanel("Quarterly ongoing illnesses in Sweden"),
  sidebarLayout(
    sidebarPanel("test"),
    mainPanel("TEST",
              tags$head(tags$style("tfoot {display: table-header-group;}")),
              fluidRow(
                column(12,
                       dataTableOutput("table")))
    )
  )
)

server <- function(input, output){
  
  dataInput <- reactive({
    swesick()
    })
  
  output$table <- renderDataTable(dataInput())
}

shinyApp(ui, server)
