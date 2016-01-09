#############################################
#                                           #
#  Exploratory Data Analysis                #
#  Course Project 1                         #
#                                           #
#  Module for creating plot1.               #
#                                           #
#############################################

##Create a red histogram of Global Active Power
createPlot1 <- function(sendToFile = FALSE){
 
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
        png(filename = "plot1.png")
    }
    
    #Create histogram
    xLabel <- "Global Active Power (kilowatts)"
    yLabel <- "Frequency"
    histColor <- "red"
    histTitle <- "Global Active Power"
    hist(dataSet$Global_active_power, xlab = xLabel, ylab = yLabel, col = histColor, main = histTitle)
    
    #Close png file, if necessary
    if(sendToFile)
    {
        dev.off()
    }
}
    