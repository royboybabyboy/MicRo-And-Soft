
ui <- fluidPage(
  navbarPage('something',
    tabPanel("loan",
      sidebarLayout(
        sidebarPanel(
          selectInput("loan_type", label = "Direct Loan Type", choices = unique(by_school_long$loan_type)),
          radioButtons("measure", label = "Measure", choices = colnames(by_school_long[7:8]))
          
        ),
  
    mainPanel(plotOutput("plot"),
              p("The above plot gives introductory stats concerning the total amount of each type of federal student aid.
                Use the two dropdown menus to select whther the bar chart will measure total recipients or total dollars
                loaned in financial aid. The other menu will allow you to selet the specific type of loan given for each
                school type.")))),
  
    tabPanel("roy",
             sidebarLayout(
               sidebarPanel(
                 selectInput("x_var", label = "X Variable", choices = colnames(merged_15_16[8:11]))
               ),
               mainPanel(
                 plotlyOutput("roy_plot")
                 ))),

                 
  tabPanel("grant",
    sidebarLayout(
      sidebarPanel(
        
        sliderInput("amount_choice", label="Grants (in millions)", min= grant_range[1], max= grant_range[2], value= grant_range),
        
        sliderInput("recipients_choice", label = "Grant recipients (in thousands)", min = recipients_range[1], max = recipients_range[2], value = recipients_range)
        
      ),
      
      mainPanel(
        
        plotOutput("colby_plot", click = "plot_click"),
        
        verbatimTextOutput("info")
      )
    )
    )
  )
)
