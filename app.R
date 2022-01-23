library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinythemes)
library(tidyverse)
library(readxl)
library(readr)

Tourism.Dataset <- read_csv("data/Tourism Dataset.csv")
View(Tourism.Dataset)

xtvt <- unique(Tourism.Dataset$Activities)
ctry <- unique(Tourism.Dataset$Country)


ui <- dashboardPage(skin = "purple",
  dashboardHeader(title = "Malaysia Tourism"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "introduction", icon = icon("fas fa-info")),
      menuItem("Chart", tabName = "chart", icon = icon("fas fa-chart-area"),  startExpanded = TRUE,
      menuSubItem("Sub-item 1", tabName = "subitem1"),
      menuSubItem("Sub-item 2", tabName = "subitem2")
      ),
      #menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("About", tabName = "about", icon = icon("fas fa-question")),
      menuItem("Contact Us", tabName = "contact", icon = icon("far fa-address-book"))
    ),
    
    textOutput("res")
  ),
  dashboardBody(

    tabItems(
      # First tab content
      tabItem(tabName = "introduction",
              # setBackgroundImage(
              #   #tag$img(src="intro.png")
              #   src = "intro.png",
              # 
              #   #src = "https://i.pinimg.com/originals/bf/53/20/bf5320094be7b938473da083206b4030.jpg",
              #   shinydashboard = TRUE
              # 
              # ),
              #style='background-color:powderblue'
              
                      fluidRow(
                column(3),
                column(6,
                       shiny::HTML("<div style = 'background-color: white;width: 300px;padding: 20px;margin: 20px;opacity: 0.8;'><center><h1>What you'll find here</h1></p></center><br>"),
                       shiny::HTML("<h5>An interactive tool to help you explore the actual paths employees 
                                                   have taken during their County careers. With information about the 
                                                   popularity of certain paths, salary differences, and more, you can 
                                                   build your own path based on what is meaningful to you.</h5></div>")
                ),
                column(3)
              ),
              fluidRow(
                
                style = "height:50px;"),
              
            ),
      # Sec tab content
      tabItem(tabName = "chart",
              # #value box
              # fluidRow(
              #   # A static valueBox
              #   valueBox(10 * 2, "New Orders", icon = icon("credit-card")),
              #   
              #   # Dynamic valueBoxes
              #   valueBoxOutput("progressBox"),
              #   
              #   valueBoxOutput("approvalBox")
              # ),
              # fluidRow(
              #   # Clicking this will increment the progress amount
              #   box(width = 4, actionButton("count", "Increment progress"))
              # ),
              # fluidRow(
              #   box(plotOutput("plot1", height = 250)),
              #   
              #   box(
              #     title = "Controls",
              #     sliderInput("slider", "Number of observations:", 1, 100, 50)
              #   )
              # )
              
            ),
      #Subtab first
      tabItem("subitem1",
              fluidRow(
                theme = shinytheme("united"),
                
                # Application title
                titlePanel("Malaysia Tourism"),
                
                # Sidebar with a slider input for number of bins
                box(
                  title = "Inputs", status = "warning", solidHeader = TRUE, width = 5,
                  selectInput("activity",
                              h3("Activity:"),
                              c(xtvt),
                              xtvt[1]),
                  
                  selectInput("country",
                              h3("Country:"),
                              c(ctry),
                              ctry[1]),
                ),
                box(
                  title = "Histogram", status = "primary", solidHeader = TRUE, width = 7,
                  # Show a plot of the generated distribution
                  
                    plotOutput("plot1",height = 250),
                    
                    # test part>>>
                    
                    textOutput("text"),
                    verbatimTextOutput("print")
                    
                    #test part>>>
                  
                ),
                # sidebarLayout(
                #   sidebarPanel(
                #     selectInput("activity",
                #                 h3("Activity:"),
                #                 c(xtvt),
                #                 xtvt[1]),
                # 
                #     selectInput("country",
                #                 h3("Country:"),
                #                 c(ctry),
                #                 ctry[1]),
                #   ),
                  
                  # # Show a plot of the generated distribution
                  # mainPanel(
                  #   
                  #   plotOutput("plot1"),
                  #   
                  #   # test part>>>
                  #   
                  #   textOutput("text"),
                  #   verbatimTextOutput("print")
                  #   
                  #   #test part>>>
                  # )
                ),
              ),
      #subtab second
      tabItem("subitem2", "Sub-item 2 tab content"),
      
      # Second tab content
      tabItem(tabName = "about",
              
              h2("Widgets tab content")
      ),
      tabItem(tabName = "contact",
              #h2("Widgets tab content")
              fluidRow(
                shiny::HTML("<div class='container'style = 'background-color: black;width: 600px;padding: 20px;margin: 20px;opacity: 0.8;'>
   <div class='row' >
    <div class='col-md-12'>
      <h1 class='title fit-h2' style='color:white;'>Contact Us</h2>
    </div>
  </div>
  <div class='marketing'>
    <div class='row'>
      <div class='col-md-4'>
        <img class='img-circle' src='images/todd.jpg' alt=''>
        <h4 style='color:white;'>Deepiga A/P Loganathamoorthy (Leader)</h4>
        <p style='color:white;'>S2114748</p>
        <a href='mailto:s2114748@siswa.um.edu.my '>Gmail</a>
      </div>
        <div class='col-md-4'>
        <img class='img-circle' src='images/todd.jpg' alt=''>
        <h4 style='color:white;'>Nadia Nadhirah Mahzan</h4>
        <p style='color:white;'>S2107527</p>
        <a href='mailto:s2107527@siswa.um.edu.my'>Gmail</a>
      </div>
                            
        <div class='col-md-4'>
        <img class='img-circle' src='images/todd.jpg' alt=''>
        <h4 style='color:white;'>Kaveta A/P Reveendran</h4>
        <p style='color:white;'>S2127193</p>
        <a href='mailto:s2127193@siswa.um.edu.my'>Gmail</a>
      </div>
      </div>
                            
      <div class='row'>
      <div class='col-md-4'>
        <img class='img-circle' src='images/todd.jpg' alt=''>
        <h4 style='color:white;'>Nur Iffahtul Najihah  Anuar</h4>
        <p style='color:white;'>17155569</p>
        <a href='mailto:17155569@siswa.um.edu.my'>Gmail</a>
      </div>
      <div class='col-md-4'>
        <img class='img-circle' src='images/todd.jpg' alt=''>
        <h4 style='color:white;'>Nurul Shahirah Sha'ari</h4>
        <p style='color:white;'>S2120876</p>
        <a href='mailto:s2120876@siswa.um.edu.my'>Gmail</a>
      </div>
      </div>
      </div>
</div>
                            "),
                
              ),
      )
    )
  )
)
#   dashboardBody(
# 
#   )
# )

server <- function(input, output) {
  
  #ExpendedItem
  # output$res <- renderText({
  #   #req(input$sidebarItemExpanded)
  #   #paste("Expanded menuItem:", input$sidebarItemExpanded)
  # })
  
  #topbox
  output$progressBox <- renderValueBox({
    valueBox(
      paste0(25 + input$count, "%"), "Progress", icon = icon("list"),
      color = "purple"
    )
  })
  
  output$approvalBox <- renderValueBox({
    valueBox(
      "80%", "Approval", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  
  #plot rendering
  output$plot1 <- renderPlot({
    
    #filter original dataset according to the selected  activity and country
    ds1 <- subset(Tourism.Dataset, Activities == input$activity, select = Year:Activities)
    ds2 <- subset(ds1, Country == input$country, select = Year:Activities)
    
    #plot function
    ggplot(ds2, aes(Year, Percentage)) +
      geom_point(colour = "red", size = 3) + 
      geom_line(colour = "blue") +
      ggtitle(paste("Visitors from ", ds2$Country,"\ncoming for ", ds2$Activities )) +
      theme_light()
  })
  
  #test part >>>
  
  output$text <- renderText(input$activity)
  output$print <- renderPrint(input$country
  )
  #test part >>>
  
}

shinyApp(ui, server)