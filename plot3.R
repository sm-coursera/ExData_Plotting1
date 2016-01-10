#############################################
#                                           #
#  Exploratory Data Analysis                #
#  Course Project 1                         #
#                                           #
#  Module for creating plot3.               #
#                                           #
#############################################

##Create a plot of Sub metering vs. 
##Date and time of measurement. With three
##submetering types and legend.
createPlot3 <- function(sendToFile = FALSE){
    
    #If data reader module hasn't been loaded, load it.
    if(!exists("getPowerConsumptionData")){
        source("ReadFile.R")
    }
    #Get data for power consumption for
    #February 1 and 2, 2007
    dataSet <- getPowerConsumptionData()
    
    #Open a png device if necessary
    if(sendToFile)
    {
        png(filename = "plot3.png")
    }
    
    #Create plot
    xLabel <- "" #No label
    yLabel <- "Energy sub metering"
    plotType <- "l" #lines
    plot(dataSet$DateTime, dataSet$Sub_metering_1, col = "black", 
         xlab = xLabel, ylab = yLabel, type = plotType)
    lines(dataSet$DateTime, dataSet$Sub_metering_2, col = "red")
    lines(dataSet$DateTime, dataSet$Sub_metering_3, col = "blue")
    
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           cex = .8, y.intersp = 1.2, lwd = 1, col = c("black", "red", "blue"))
    
    #Close png file, if necessary
    if(sendToFile)
    {
        dev.off()
    }
}
