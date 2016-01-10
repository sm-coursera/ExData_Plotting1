#############################################
#                                           #
#  Exploratory Data Analysis                #
#  Course Project 1                         #
#                                           #
#  Module for creating plot2.               #
#                                           #
#############################################

##Create a plot of Global_active_power vs. 
##Day and time of measurement.
createPlot2 <- function(sendToFile = FALSE){
    
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
        png(filename = "plot2.png")
    }
    
    #Create plot
    xLabel <- "" #No label
    yLabel <- "Global Active Power (kilowatts)"
    plotType <- "l" #lines
    plot(dataSet$DateTime, dataSet$Global_active_power, xlab = xLabel, ylab = yLabel, type = plotType)
    
    #Close png file, if necessary
    if(sendToFile)
    {
        dev.off()
    }
}
