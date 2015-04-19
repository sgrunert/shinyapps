###################################################
#Author: S. Grunert
#Created: 18April2015
#Version: 1.0
#Description:
#This is a Shiny App for Coursera Developing Data Products: devdataprod-013
###################################################

shinyUI(pageWithSidebar(
        headerPanel("Illustration: Nitrox vs Air Depth Limits in Scuba Diving"),
        sidebarPanel(
                sliderInput('O2'
                            ,h5(strong('Select a Nitrox Oxygen Level (0.21=21%O2=Air)'))
                            ,value = .21
                            ,min = .21
                            ,max = .40
                            ,step = 0.01,),
                h6(strong('Description:')),
                h6('This plot shows the relationship between depth limits 
                when Scuba diving with a tank of air (max of 130 ft, the red line) and air 
                supplemented with added oxygen, known as Nitrox (the orange line).
                The air limit is based on the risk of decompression sickness from 
                nitrogen. The Nitrox limit is based on an increased risk of 
                oxygen toxicity. Scuba divers must stay shallower than both 
                limits.'),
                h6(strong('Instructions:')),
                h6('1) Move the above slider to indicate a Nitrox oxygen level. 
                   0.21 (21%) is regular air. 0.40 (40%) is the maximum allowed.'),
                h6('2) Note the inflection point where the higher Oxygen Level 
                   begins to limit the Max Allowed Depth.')
        ),
        mainPanel(
                plotOutput('depthplot')
        )
))