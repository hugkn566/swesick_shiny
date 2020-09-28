#app.r
ui <- fluidPage(
  titlePanel("Quarterly ongoing illnesses in Sweden"),
  sidebarLayout(
    sidebarPanel(sliderInput("range", "Year:",
                             min = 2005, max = (as.numeric(substr(date(), (nchar(date())-3), nchar(date())))-1),
                             value = c(2005, max), step = 1, sep = ""),
                 checkboxGroupInput("columns", "Variables to show:",
                             c("Kvartal" ="kvartal",
                               "År" = "ar" ,
                               "Diagnoskapitel text" = "diagnoskapitel_text",
                               "Andel" = "andel",
                               "Diagnoskapitel kod" = "diagnoskapitel_kod" ,
                               "Antal" = "antal", 
                               "Antal män" = "antal_man",
                               "Andel kvinnor" = "andel_kvinnor", 
                               "Antal kvinnor" = "antal_kvinnor", 
                               "Andel män" = "andel_man"
                               ), width = '100%',
                             inline = TRUE,
                             selected = c("kvartal",
                                          "ar",
                                          "diagnoskapitel_text",
                                          "andel",
                                          "diagnoskapitel_kod",
                                          "antal",
                                          "antal_man",
                                          "andel_kvinnor",
                                          "antal_kvinnor",
                                          "andel_man")
                             )),
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
    data <- data
    data <- data[data$ar >= input$range[1] & data$ar <= input$range[2], input$columns]
    })
  
  
  
  
  output$table <- renderDataTable(dataInput())
}

shinyApp(ui, server)
