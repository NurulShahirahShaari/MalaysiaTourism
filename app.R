library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinythemes)
library(tidyverse)
library(readxl)
library(readr)
library(dplyr)
library(ggplot2)

urlfile="https://raw.githubusercontent.com/NurulShahirahShaari/MalaysiaTourism/main/data/Tourism%20Dataset.csv"
Tourism <- read.csv(url(urlfile))
#View(Tourism.Dataset)

xtvt <- unique(Tourism$Activities)
ctry <- unique(Tourism$Country)


ui <- dashboardPage(skin = "purple",
  dashboardHeader(title = "Malaysia Tourism"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "introduction", icon = icon("fas fa-info")),
      menuItem("Chart", tabName = "chart", icon = icon("fas fa-chart-area"),  startExpanded = TRUE,
      menuSubItem("Chart 1", tabName = "subitem1"),
      menuSubItem("Chart 2", tabName = "subitem2")
      ),
      menuItem("About Us", tabName = "about", icon = icon("far fa-address-book"))
    ),
    
    textOutput("res")
  ),
  dashboardBody(

    tabItems(
      # First tab content
      tabItem(tabName = "introduction",
              setBackgroundImage(
                #tag$img(src="intro.png")
                src = "https://raw.githubusercontent.com/NurulShahirahShaari/MalaysiaTourism/main/www/intro.png",

                #src = "https://i.pinimg.com/originals/bf/53/20/bf5320094be7b938473da083206b4030.jpg",
                shinydashboard = TRUE

              ),
              
              
                      fluidRow(
                column(3),
                column(6,
                       shiny::HTML("<br><br><div style = 'background-color: white;width: 400px;padding: 20px;margin: center;opacity: 0.8;'><center><h1>What you'll find here</h1></p></center><br>"),
                       shiny::HTML("<h5>A tool to let you explore the activities in each country and the level of tourists’ preferences before COVID pandemic. Information on visited 
                                   tourists in Malaysia by countries has been integrated as well. With information about the activity based tourist attractions of each country and 
                                   tourist frequency in Malaysia between 2016 to 2019, you can predict the best country to visit based on your interest in sports activity or the 
                                   most and least activities preferred in a particular country. Within Malaysia, this app will help you to decide in planning the activities related 
                                   to tourist visits and THE next tourism based businesses or investments.</h5></div>")
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
                  titlePanel(
                  shiny::HTML("<div><p><h3 style='background-color: black; color:white;width: 500px;padding: 20px;opacity: 0.8;'>Activity That Attracts The Most Visitor in Relation with Country</h3></p><br>"),
                ),

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
              ),
              ),
      #subtab second
      tabItem("subitem2", 
              
              fluidRow(
                # Application title
                titlePanel(
                  shiny::HTML("<div><p><h3 style='background-color: black; color:white; text-indent: 20px;width: 500px;padding: 20px;opacity: 0.8;'>Activity Based on Country and Year</h3></p><br>"),
                ),

                # Sidebar with a slider input for number of bins
                box(
                  title = "Inputs", status = "warning", solidHeader = TRUE, width = 5,
                  selectInput(inputId = "sel_Year", label = "Choose year:","Names"),
                ),
            
                  # Show a plot of the generated distribution
                box(
                  title = "Histogram", status = "primary", solidHeader = TRUE, width = 7,
                  # Show a plot of the generated distribution

                  plotOutput("plot")

                ),
                
               ),
              
            ),
      
      # Third tab content
      tabItem(tabName = "about",
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

server <- function(input, output, session) {
  
  #ExpendedItem
  # output$res <- renderText({
  #   #req(input$sidebarItemExpanded)
  #   #paste("Expanded menuItem:", input$sidebarItemExpanded)
  # })
  
  # #topbox
  # output$progressBox <- renderValueBox({
  #   valueBox(
  #     paste0(25 + input$count, "%"), "Progress", icon = icon("list"),
  #     color = "purple"
  #   )
  # })
  # 
  # output$approvalBox <- renderValueBox({
  #   valueBox(
  #     "80%", "Approval", icon = icon("thumbs-up", lib = "glyphicon"),
  #     color = "yellow"
  #   )
  # })
  
  #plot rendering
  output$plot1 <- renderPlot({

    #filter original dataset according to the selected  activity and country
    ds1 <- subset(Tourism, Activities == input$activity, select = Year:Activities)
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
  
  output$plot <- renderPlot({
    
    #group activities by mean percentage
    data <- reactive({
      req(input$sel_Year)
      df <- Tourism %>% filter(Year %in% input$sel_Year) %>% group_by(Country) %>% summarise(Percentage=mean(Percentage))
    })
    
    #update select input dynamically
    observe({
      updateSelectInput(session, "sel_Year", choices = Tourism$Year)
    })
    
    output$plot <- renderPlot({
      #plot
      # barplot(df$Percentage)
      g <- ggplot(data(), aes(y = Country, x = Percentage))
      g + geom_bar(stat = "summary")
    })
    
    
  })
  
}

shinyApp(ui, server)