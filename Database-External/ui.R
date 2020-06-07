# Flight-Dashboard using Shiny. 
# Written by : Sofia Nicklaus S.
# Department of Business statistics, Matana University (Tangerang)
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("global.R", local = TRUE)

ui <- dashboardPage(title = "www.sofianicklaus.com",
        
        dashboardHeader(title = "Flights Dashboard",titleWidth = 200),
        
        dashboardSidebar(
          selectInput(
          inputId = "airline",
          label = "Airline:",
          choices = airline_list,
          selected = "DL",
          selectize = FALSE),
        sidebarMenu(selectInput(
          inputId = "month",
          label = "Month:",
          choices = month_list,
          selected = 99,
          size = 13,
          selectize = FALSE),
        actionLink("remove", icon = icon("sync-alt"),"Remove detail tabs"),
        menuItem("About Me", icon = icon("linkedin"), href = "https://www.linkedin.com/in/sofia-ns/"),
        menuItem("Source Code", icon = icon("github"), href = "https://github.com/sofia3484/Flights-Dashboard"),
        menuItem("Video", icon = icon("youtube"), href = "https://youtu.be/N1ycn8ZVcuM")
        
        )),
        
        dashboardBody(gitlink::ribbon_css("https://github.com/Bakti-Siregar/Flights-Dashboard", 
                          position = "right", 
                          parent_css = list("z-index" = "1040", "pointer-events" = "none"),
                          "pointer-events" = "auto"
                        ),
        tabsetPanel(id = "tabs",
          tabPanel(title = "Main Dashboard",
                   value = "page1",
                  fluidRow(valueBoxOutput("total_flights"),
                           valueBoxOutput("per_day"),
                           valueBoxOutput("percent_delayed")),
                  fluidRow(column(width = 6,d3Output("group_totals")),
                           column(width = 6,d3Output("top_airports"))
                            )
                          )
                        )
                      )
                    )
