ui <- fluidPage(
  titlePanel("Federal Student Aid"),
  sidebarLayout(
    sidebarPanel(
      selectInput("loan_type", label = "Direct Loan Type", choices = unique(by_school_long$loan_type)),
      radioButtons("measure", label = "Measure", choices = colnames(by_school_long[7:8]))
      
    ),
    mainPanel(plotOutput("plot"),
              p("The above plot gives introductory stats concerning the total amount of each type of federal student aid.
                Use the two dropdown menus to select whther the bar chart will measure total recipients or total dollars
                loaned in financial aid. The other menu will allow you to selet the specific type of loan given for each
                school type."))
  )
  
)



