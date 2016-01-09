#############################################
#                                           #
#  Exploratory Data Analysis                #
#  Course Project 1                         #
#                                           #
#  Module for loading the data required for #
#  creating the four plots.                 #
#                                           #
#############################################

##Load and filter data used to create the plots.
getPowerConsumptionData <- function(dates = NULL){
    
    #Read full data set
    dataSource <- "household_power_consumption.txt"
    dataSet <- read.csv(dataSource, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
    
    #If a filter was set, filter records to the days we want
    if(!is.null(dates)){
        dataSet <- dataSet[dataSet$Date %in% dates,]
    }

    #Convert Date and Time columns to proper Datetime column
    dataSet$DateTime <- as.POSIXct(paste(dataSet$Date, dataSet$Time), format = "%d/%m/%Y %H:%M:%S")
    
    #Return filtered, conditioned data set.
    dataSet
}

