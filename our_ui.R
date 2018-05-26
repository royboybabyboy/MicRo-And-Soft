ui <- fluidPage(
  titlePanel("Federal Student Aid"),
  sidebarLayout(
    sidebarPanel(
      selectInput("loan_type", label = "Direct Loan Type", choices = unique(by_school_long$loan_type)),
      radioButtons("measure", label = "Measure", choices = colnames(by_school_long[7:8]))
      
    ),
    mainPanel(plotOutput("plot"))
  )
  
)



