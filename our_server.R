library(dplyr)
library(ggplot2)
library(shiny)
library(rsconnect)

# setwd("C:/Users/ddami/Desktop/Info Homework/MicRo-And-Soft")

by_location <- read.csv("data/by_location.csv", stringsAsFactors = FALSE)
by_school <- read.csv("data/by_school_15-16_Q1.csv", stringsAsFactors = FALSE)

by_school_long <- by_school %>%
  gather(loan_type, value, c(dl_sub_num, unsub_ug_num, unsub_grad_num, parent_plus_num, grad_plus_num)) %>% 
  select(ope_id, school, state, zip_code, school_type, loan_type, value)

by_school_long_2 <- by_school %>% 
  gather(loan_type_2, value_2, c(dl_sub_dollars, unsub_ug_dollars, unsub_grad_dollars, parent_plus_dollars, grad_plus_dollars))

by_school_long$total_dollars <- by_school_long_2$value_2

by_school_long$loan_type <- ifelse(by_school_long$loan_type=="dl_sub_num","Subsidized Loan",by_school_long$loan_type)
by_school_long$loan_type <- ifelse(by_school_long$loan_type=="unsub_ug_num","Unsubsidized Undergrad Loan",by_school_long$loan_type)
by_school_long$loan_type <- ifelse(by_school_long$loan_type=="unsub_grad_num","Unsubsidized Graduate Loan",by_school_long$loan_type)
by_school_long$loan_type <- ifelse(by_school_long$loan_type=="parent_plus_num","Parent Plus Loan",by_school_long$loan_type)
by_school_long$loan_type <- ifelse(by_school_long$loan_type=="grad_plus_num","Graduate Plus Loan",by_school_long$loan_type)
colnames(by_school_long) <- c(colnames(by_school_long[1:6]), "Recipients", "Total Amount")






server <- function(input, output, session) {
  output$plot <- renderPlot({
      fed_aid_data <- by_school_long %>% 
        filter(loan_type == input$loan_type) %>% 
        group_by(school_type) %>%
        summarize(
          total_num = sum(as.numeric(Recipients), na.rm = TRUE),
          total_amt = sum(as.numeric(`Total Amount`), na.rm = TRUE)
          
        )
     
      
      aid_plot <- ggplot(data = fed_aid_data) +
        geom_bar(mapping = aes(x = school_type, fill = school_type))
      aid_plot
      
    })
}





