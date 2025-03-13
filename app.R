#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)
library(bslib)
library(fontawesome)
library(scales)
library(plotly)

committee_list <- read_csv("data/Committee_list.csv") %>%
  mutate_if(is.character, utf8::utf8_encode)

# Define UI for application that draws a histogram
ui <- page_sidebar(
  
  # Application title
  title = "CascadiaR Call For Presentations Review Portal",

    # Sidebar with a slider input for number of bins 
  sidebar = sidebar(
    
    selectizeInput("reviewer_name", label = "Reviewer Name:", choices = committee_list %>% pull(Name), 
                   selected = NULL, multiple = FALSE, options = NULL)#,
  ),
  
  navset_card_underline(
    nav_panel("Instructions", 
              #layout_column_wrap(
              #  width = 1/3,
              #  value_box(
              #    "Last Submission",
              #    valueBoxOutput("agency_last_sub"),
              #    theme = "primary",
              #    showcase = fa_i("calendar-days")
              # ), 
              #  value_box(
              #    "Last Month",
              #    valueBoxOutput("agency_last_mo"),
              #    theme = "primary",
              #    showcase = fa_i("calendar-days")
              #  ), 
              #  value_box(
              #   "Last Year",
              #    textOutput("XX"),
              #    theme = "primary",
              #    showcase = fa_i("calendar-days")
              #  )
              #),
              card(
                strong("Talk review instructions:", style = "color:red"),
                
                p("Thank you for agreeing to help review Cascadia R Conf talk submissions!  
                Your ratings will be used to help select the top talks, which will then 
                review for the final selection."),

                p("Your job is to read the title and abstract, then score the talk on these criteria:"),

                strong("The topic (1-5) —"), div("this is a combination of the proportion of the R community 
                that’s likely to be interested in the topic, and how much impact the talk will 
                have on their data science practice.  Scoring criteria:"),
                
                p("5 = likely to be of great interest to a wide swathe of the R community and 
                the talk will have an impact on their day-to-day life."),
                p("3 = high interest but low impact OR high impact but only to a smaller group 
                of people."),
                p("1 = of very limited or specialised interest; unlikely to have impact on 
                listeners’ practice of data science."),

                strong("Cascadia Region?"),
                p("Indicate whether they have identified themselves as being located in the 
                Cascadia Region"),

                strong("Representation"),
                p("Indicate if the speaker represents a group that has historically been less 
                visible in the R community. There are many reasons you might check this box; 
                perhaps race, gender, or they are a student or new to the community. This is 
                a broad category."),

                strong("Golden Buzzer"),
                p("If you LOVE a talk proposal, you can also press the “golden buzzer” — this 
                will guarantee that the talk makes it to the final round of review, regardless 
                of the other scores. Please use this sparingly — you should award it to no more 
                than two talks."),

                p("You don't have to review every submission if you don't have time, but 
                please do as many as you can so we can have at least 2 reviewers' eyes on each 
                proposal."),

                strong("Please complete your reviews by 4pm PT March 22.", style = "color:red")
                

 
              )
    ),
    nav_panel("Timeliness", 
              
    ),
    nav_panel("Completeness"
              
    ),
    
    nav_panel("Validity"
              
    ),
    nav_panel("Notes"
              
    )
  )
  
)


# Define server logic required to draw a histogram
server <- function(input, output) {

    
}

# Run the application 
shinyApp(ui = ui, server = server)
