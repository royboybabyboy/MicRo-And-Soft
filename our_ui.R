
ui <- fluidPage(
  navbarPage('Education Financial Data',
    tabPanel("Home", 
             mainPanel(
               h1("Educational Financial Data"),
                h2("Data Sets"),
                  h3("Student Aid"),
                     p(strong("Loan Data:"), "The Loan Data and the Grant Data visualization use a data frame from the official student aid website, studentaid.ed.gov, from the first quarter of 2015. The data contains a breakdown of recipient and total amount data for five different types of federal loans.
                        That data is grouped into school type, and then presented in an interactive bar chart that allows the user to select both the loan type they would like to examine as well as whether they would
                        like to view the numbers for total recipients or total dollar amount for that loan type."),
                  h3("Student Debt"),
                      p(strong("Student Debt Data:"), "The Debt Data visualization utilizes a data frame from the officialCollege Score card Website at  collegescorecard.ed.gov/data/, from the first the years spanning 2015 to 2016. The data contains a breakdown of total debt values by institution as well as many
                        of the pertinent variables to compare them too. For instance, Tuition for Universities both In State and Out of State and the Loan Rate among the student population. A student interested in their graduation debt amount should look into this graph as it depicts the general relationship between 
                        their school choice and their expected graduation debt. That being said, we found a unique set of conclusions to which a singualr decision should not be based on our analysis, rather, as one component to a complicated life decision..")
      
    )
    ),
    tabPanel("Loan Data",
      sidebarLayout(
        sidebarPanel(
          selectInput("loan_type", label = "Direct Loan Type", choices = unique(by_school_long$loan_type)),
          radioButtons("measure", label = "Measure", choices = colnames(by_school_long[7:8]))
          
        ),
  
    mainPanel(plotOutput("plot"),
              strong(h2("Loan Types")),
              p(strong("Subsidized:"), "Available to students in need, the US Department of Education pays the interest on the amount the individual school determines is necessary for the financial aid package."),
              p(strong("Undergraduate Unsubsidized:"), "Loans dispensed in the amount determined by the school to be adequate for attendance, these loans require the undergraduate borrower to pay the interest when the period of forbearance (time as a student) expires."),
              p(strong("Graduate Unsubsidized:"), "Same as undergraduate unsubsidized lonas, but for graduate students instead."),
              p(strong("Parent Plus:"), "Loans taken by a parent from the Department of Education on behalf of their student to cover excess education expenses not covered by other financial aid. The borrower pays the interest and must not have an adverse credit history."),
              p(strong("Graduate Plus:"), "Same as Parent Plus loans, but taken out by a graduate student instead of the parent of a student."),
              
              em(p("Question 1: How significant is the gap between public school aid and aid to other types of school?")),
              em(p("Question 2: Is there a particular type of loan that is seen more often in another school type than it is in pubblic schools?")),
              p("Although most of the data in the plot supported our expectations of public schools recieving
                the majority of funds from all types of loans, our group was surprised to see a discrepancy when graduate loans were considered.
                In both unsubsidized graduate loans and graduate plus loans, private saw a large jump in recipients and total amount
                as compared to public schools.  Likewise, it seemed that the other types of schools were more likely to have students
                recieving aid for graduate students than they were for students in their undergraduate program.")))),
  
    tabPanel("Debt Data",
             sidebarLayout(
               sidebarPanel(
                 selectInput("x_var", label = "X Variable", choices = list("In State Tuition", "Out of State Tuition", "Loan Ever"))
               ),
               mainPanel(
                 plotlyOutput("roy_plot"),
                 strong(h1("Median Graduation Debt Data")),
                  p("The plot above showes the relationship between the Median Graduation Debt and the resepective X variable choosen. In this section we are concerned about the relationship
                   the two varibales and to answer three questions."),
                 em(p("1. What is the relationship between In State Tuition and the Median Debt Graduation Debt?")),
                 em(p("2. What is the relationship between the Out of State Tuiition and Median Debt Graduation Debt and how does that compare to In State?")),
                 em(p("3. Of these two characteristics, what is the relationship between people who have taken out a Loan Ever and the Median Graduation Debt")),
                 strong(h2("Hypotheses")),
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

                 
  tabPanel("Grant Data",
    sidebarLayout(
      sidebarPanel(
        
        sliderInput("amount_choice", label="Grants (in millions)", min= grant_range[1], max= grant_range[2], value= grant_range),
        
        sliderInput("recipients_choice", label = "Grant recipients (in thousands)", min = recipients_range[1], max = recipients_range[2], value = recipients_range)
        
      ),
      
      mainPanel(
        
        plotOutput("colby_plot", click = "plot_click"),
        
        verbatimTextOutput("info"),
        strong(h1("Total Grant Data")),
        p("The plot above shows the relationship between grant recipients and the dollar amount of grants dispersed in each state's universities during the 2015
          fall quarter. The sliders can be used to narrow down the data in order to see more individual states that might be overlapping. Also, if you click on the 
          individual points it'll show you which state the point corresponds to. If the points are overlapping, it'll show all the states that you clicked on.This graph 
          helps answer questions such as:" ),
        em(p("1. What is the relationship between amount of grant recipients and amount of grants dispersed?")),
        em(p("2. What states have the highest grant amounts as well as recipients?")),
        strong(h2("Hypotheses")),
        p("1. There will be a string correlation between grant recipients and amount of grants dispersed."),
        p("2. States with higher populations will have significantly more grant recipients as well as amount of grants dispersed."),
        strong(h2("Conclusions")),
        p("1. The correlation between is, as predicted, very strong. The correlation is practically linear. This seems obvious but it's still an important conclusion."),
        p("2. Our second conclusion from this graph is that, for the most part, a state with a higher population than another also has higher grant recipients as well as
         higher total grants dispersed. There are some states, such as New York, that have slightly higher amounts of grants/recipients but have a smaller population than 
         other states. This is because there are significantly more universities in New York than there are in Florida, which is also usually the case where other states
          have higher amounts of grants/recipients but have a smaller population.")
        
      
  
      )
    )
    ),
  tabPanel("Pooja Data")
  )
)
