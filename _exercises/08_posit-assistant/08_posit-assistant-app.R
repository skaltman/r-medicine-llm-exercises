library(shiny)
library(bslib)
library(querychat)
library(DT)

health_exp <- readr::read_csv(
  "~/r-medicine-llm-exercises/data/health-expenditure.csv",
  show_col_types = FALSE
)

qc <- QueryChat$new(
  health_exp,
  data_description = "data_description.md"
)

ui <- page_sidebar(
  title = "Health Expenditure Explorer",
  sidebar = qc$sidebar(),
  card(
    card_header("Data Table"),
    dataTableOutput("table")
  )
)

server <- function(input, output, session) {
  qc_vals <- qc$server()

  output$table <- renderDataTable({
    datatable(qc_vals$df(), fillContainer = TRUE)
  })
}

shinyApp(ui, server)
