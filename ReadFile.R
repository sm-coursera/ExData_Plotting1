#############################################
#                                           #
#  Exploratory Data Analysis                #
#  Course Project 1                         #
#                                           #
#  Module for loading the data required for #
#  creating the four plots.                 #
#                                           #
#############################################

##Cache the data set here for repeat use since 99% of the
##time used to create a plot is needed to load and condition
##the data.
powerConsumptionDataSet <- NULL

##Load and filter data used to create the plots. Could
##be made more generic by passing in list of dates, name 
##of data source, etc. but its not worth the complications 
##for this assignment.
getPowerConsumptionData <- function(){
    
    #Check to see if the dataset has already been loaded.
    if(is.null(powerConsumptionDataSet)){
        #Read full data set
        dataSource <- "household_power_consumption.txt"
        dataSet <- read.csv(dataSource, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
    
        #Filter records to the days we want
        dataSet <- dataSet[dataSet$Date %in% c("1/2/2007", "2/2/2007"),]

        #Convert Date and Time columns to proper Datetime column
        dataSet$DateTime <- as.POSIXct(paste(dataSet$Date, dataSet$Time), format = "%d/%m/%Y %H:%M:%S")
    
        #Cache the data for future plotting calls.
        powerConsumptionDataSet <<- dataSet
    }
    
    #Return filtered, conditioned data set.
    powerConsumptionDataSet
}

