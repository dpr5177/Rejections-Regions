
library(shiny)
library(shinydashboard)

dashboardPage(skin="blue",
              
              #Title
              dashboardHeader(title="Rejection Regions",titleWidth=450),
              
              #Sidebar
              dashboardSidebar(
                width = 260,
                sidebarMenu(
                  
                  menuItem("Overview", tabName = "over", icon = icon("university")),
                  menuItem("Plot", tabName = "plot", icon = icon("area-chart")),
                  menuItem("Z Table", tabName = "zTab", icon =icon("table")),
                  menuItem("Review", tabName = "post", icon = icon("pencil-square"))
                )),
              
              #define the body of the app
              dashboardBody(
                tabItems(
                  
                  #actual app layout      
                  tabItem(tabName = "over",
                          
                          fluidRow(
                            
                            column(5,br(),br(),
                                   img(src="PSU.png")
                            )
                          )
                  ),
                  tabItem(tabName = "plot",
                          
                          fluidRow(
                            withMathJax(),
                            
                            column(4,
                                   br(),
                                   radioButtons("dist","Distribution:",c("Z","t"),selected="Z"),
                                   sliderInput("alpha","Significance level (alpha):",0.05,min=0.005,max=0.250,step=0.005),
                                   radioButtons("tails","Tails type:",c("Two tailed"='two',"Left tailed"='left',"Right tailed"='right')),
                                   conditionalPanel(
                                     condition="input.dist == 't'",
                                     numericInput("tdf","Degrees of Freedom",15)
                                   )
                            ),
                            
                            
                            column(8,
                                   fluidRow(
                                     plotOutput("plot")
                                   )
                            )
                          )
                  ),
                  tabItem(tabName = "zTab",
                          fluidRow(
                            img(src = "NormalTable.png")


                          )
                  ),
                  tabItem(tabName = "post",
                          fluidRow(
                            #add in latex functionality if needed
                            withMathJax(),
                            
                            #two columns for each of the two items
                            
                            column(6,
                                   #what did they learn
                                   h1("Learning Objectives:"),
                                   selectizeInput("topic","Select the topic you would like to look at. ",choices = c("Population Proportion", "Population Mean", "Difference"), multiple = FALSE),
                                   conditionalPanel(condition = "input.topic =='Population Proportion'", 
                                                    selectizeInput("ques","Question: ", c("1","2","3","4","5"))
                                   ),
                                   conditionalPanel(condition = "input.topic =='Population Mean'", 
                                                    selectizeInput("ques","Question: ", c("1","2","3","4","5"))
                                   ),
                                   br(),br(),br(),
                                   conditionalPanel(condition = "input.topic =='Difference'", 
                                                    selectizeInput("ques","Question: ", c("1","2","3","4","5"))
                                   )
                            ),
                            
                            column(6,
                                   #continuation
                                   h1("Also"),
                                   #box to contain description
                                   box(background="blue",width=12,
                                       h4("lksadjfl;kasdfh;lkhfghklshld. ")
                                   )
                            )
                          )
                  )
                )
              )
)

