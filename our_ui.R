
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
  
    tabPanel("Median Debt Data by School VS.",
             sidebarLayout(
               sidebarPanel(
                 selectInput("x_var", label = "X Variable", choices = list("In State Tuition", "Out of State Tuition", "Loan Ever"))
               ),
               mainPanel(
                 plotlyOutput("roy_plot"),
                 strong(h1("Median Graduation Debt Data")),
                  p("The plot above showes the relationship betweenthe Median Graduation Debt and the resepective X variable choosen. In this section we are concerned about the relationship
                   the two varibales and to answer three questions."),
                 em(p("What is the relationship between In State Tuition and the Median Debt Graduation Debt?")),
                 em(p("What is the relationship between the Out of State Tuiition and Median Debt Graduation Debt and how does that compare to In State?")),
                 em(p("Of these two characteristics, what is the relationship between people who have taken out a Loan Ever and the Median Graduation Debt")),
                 strong(h2("Hypothesis")),
                 p("1. The Median Graduation Debt would be high among those who are non-residents and pay higher tuitions."),
                 p("2. Schools that average higher levels of students that take out loans will have a higher median of Graduation Debt"),
                 strong(h2("Conclusions")),
                 p("1. For both In State and Out of State Tuition rates the median debt has very little influence. We found this as a surprise as we assumed a 
                   more expensive college would yield a higher debt median, instead, the points just moved right (increase tuition) rather than up (increased Median Grad. Debt). 
                  We believe this could have been a result of the $27k line we discovered which was unanimous among both residents and non-residents."),
                 p("2. Our second conclusion found that people who have taken a loan out ever are more likely to have a larger median graduation loan. Although this seemed
                   rather obvious this was an added hypothesis we tested given that the previous two graphs had unsuspected results. We are happy to see this relationship as it 
                   gave us confidence in the results."),
                 p(strong(em("Additional Finding - ")), "The median graduation debt was highest among hte lowest In State and Out of State Tuition graphs with additional
                   points much lower in debt for more expensive colleges. This finding was unsuspected, as our intuition led us to believe that more expensive schools would yield 
                   higher debts. However, with our visualization we easily discovered the oppositie. We believe this could be a product of more affluent people attending more expensive
                   colleges which allows them to pay the tuition no matter the amount, therefoe skewing our hypothesis.")
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
