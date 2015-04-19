###################################################
#Author: S. Grunert
#Created: 18April2015
#Version: 1.0
#Description:
#This is a Shiny App for Coursera Developing Data Products: devdataprod-013
###################################################

shinyServer(
        function(input, output) {
                output$depthplot <- renderPlot({
                        Oxygen <- c(21:40)/100       # Range of O2 partial pressures is .21-.40   
                        Depth <-  (46.2/Oxygen - 33) # Depth adjustment formula.
                        O2 <- input$O2               # Bringing in input.
                        # Orange depth-to-oxygen partial pressure line plot.
                        plot(Oxygen,Depth,type = "l"
                             ,lwd=2
                             ,col="orange"
                             ,xlab='Oxygen Level in Nitrox Mix (N2/O2)'
                             ,ylab='Depth Limit in Feet'
                             ,main='Nitrox vs Air Depth Limits'
                             ,xaxt="n")
                        axis(1, at = seq(.20,.40, by = .02))
                        # Green slider line.
                        lines(c(O2, O2), c(0, 170),col="darkgreen",lwd=2)
                        # Red 130 ft never exceed limit.
                        lines(c(.21, .40), c(130, 130),col="red",lwd=2)
                        # Adjusting outcome (depth) to consider both limits.
                        z <-  (46.2/O2 - 33)
                        z[z > 130] <- 130
                        # Displaying predictor (O2) and outcome (depth).
                        text(.305, 181, paste("Oxygen Level:", O2),cex = 1)
                        text(.305, 174, paste("Max Allowed Depth:", round(z, 0)),cex = 1)
                        # Adding labels.
                        text(.375, 101, paste("Nitrox O2-Based Depth Limit"),cex = 0.75,col="orange")
                        text(.375, 137, paste("130 ft Air N2-Based Depth Limit"),cex = 0.75,col="red")
                        text(.265, 105, paste("Protocol is to Stay Shallower Than Both Curves"),cex = 1,col="darkgreen")                        
                    
                })
        }
)