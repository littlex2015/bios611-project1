library(shinydashboard)
library(shiny)
library(tidyverse)
library(lubridate)
library(scales)
library(tidytext)
args <- commandArgs(trailingOnly=T);

port <- as.numeric(args[[1]]);

df <- read_rds("derived_data/clean_df.rds")

choices_df <- df %>%
  select(category) %>%
  mutate(category = as.character(category)) %>%
  count(category)
choices <- c("Select All", choices_df[["category"]])
choices_num <- paste0(choices_df[["category"]], " (", choices_df[["n"]], ")")
choices_num <- c("Select All", choices_num)

ui <- dashboardPage(skin = "blue",
                    
                    dashboardHeader(title="YouTube Trending Analytics", titleWidth =350),
                    
                    dashboardSidebar(
                      
                      sidebarMenu(
                        
                        id = "tabs",
                        
                        conditionalPanel("input.my_set == 'tab1_val'",
                                         selectInput(
                                           "engagement", "Type of Engagement", c("Views",
                                                                                 "Likes",
                                                                                 "Dislikes",
                                                                                 "Comment Count"="Comment_Count"))
                        )
                        
                      )
                    ),
                    dashboardBody(
                      tabBox(
                        title = "Trended YouTube Videos Statistics",
                        id = "my_set", height = "550px", width = "850px",
                        tabPanel("Engagement by Category", id = "tab1",value='tab1_val', plotOutput("boxPlot"))
                      ) 
                    )
)

server <- function(input, output) {
  
  # boxplot
  output$boxPlot <- renderPlot({
    df %>%
      ggplot() +
      geom_boxplot(aes(fct_reorder(category, !!rlang::sym(str_to_lower(input$engagement))),
                       !!rlang::sym(str_to_lower(input$engagement)),
                       fill = category)) +
      scale_y_log10(labels = comma) +
      labs(x="", y=paste(input$engagement, "per Video")) +
      theme(legend.position = "none") + 
      theme(axis.text=element_text(size=15),
            axis.title=element_text(size=15,face="bold")) +
      coord_flip()
  })
}
  
print(sprintf("Starting shiny on port %d", port));
shinyApp(ui = ui, server = server, options = list(port=port,
                                                    host="0.0.0.0"));
  
                    
                    