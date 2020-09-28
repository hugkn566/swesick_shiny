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
  )
)

server <- function(input, output){
  output$table <- renderDataTable(swesick())
}

shinyApp(ui, server)
