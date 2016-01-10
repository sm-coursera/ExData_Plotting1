#############################################
#                                           #
#  Exploratory Data Analysis                #
#  Course Project 1                         #
#                                           #
#  Module for creating plot4.               #
#                                           #
#############################################

##Create the required four plots on one page.
createPlot4 <- function(sendToFile = FALSE){
    
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
        png(filename = "plot4.png")
    }
    
    #Set up page to accept 4 plots
    originalPar <- par(mfrow = c(2,2))
    
    
    #create Global Active Power vs DateTime plot
    xLabel <- "" #No label
    yLabel <- "Global Active Power"
    plotType <- "l" #lines
    plot(dataSet$DateTime, dataSet$Global_active_power, xlab = xLabel, ylab = yLabel, type = plotType)
    
    #create Voltage vs DateTime plot
    xLabel <- "DateTime" 
    yLabel <- "Voltage"
    plotType <- "l" #lines
    plot(dataSet$DateTime, dataSet$Voltage, xlab = xLabel, ylab = yLabel, type = plotType)

    
    #Create sub metering multi-line plot
    xLabel <- "" #No label
    yLabel <- "Energy sub metering"
    plotType <- "l" #lines
    plot(dataSet$DateTime, dataSet$Sub_metering_1, col = "black", 
         xlab = xLabel, ylab = yLabel, type = plotType)
    lines(dataSet$DateTime, dataSet$Sub_metering_2, col = "red")
    lines(dataSet$DateTime, dataSet$Sub_metering_3, col = "blue")
    
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           cex = .8, y.intersp = 1.2, lwd = 1, col = c("black", "red", "blue"), bty = "n")
    
    
    #create Global Reactive Power vs DateTime plot
    xLabel <- "DateTime"
    yLabel <- "Global Active Power"
    plotType <- "l" #lines
    plot(dataSet$DateTime, dataSet$Global_reactive_power, xlab = xLabel, ylab = yLabel, type = plotType)
    
    #reset par
    par(originalPar)
    
    #Close png file, if necessary
    if(sendToFile)
    {
        dev.off()
    }
}
