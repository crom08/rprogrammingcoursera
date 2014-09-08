#returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.
pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    #runningTotal <- 0
    #runningCount <- 0
    
    pollutantColumns <- c()
    
    
    for (monitor in id) {
        monitorFile <- paste(sprintf("%03d", monitor), "csv", 
                             sep=".")
        monitorPath <- paste(directory, monitorFile, sep="/")
        currentData <- read.csv(monitorPath)
        filteredData <- currentData[!is.na(currentData[pollutant]), ]
        pollutantColumn <- filteredData[[pollutant]]
        pollutantColumns <- c(pollutantColumns, pollutantColumn)
        #runningTotal <- runningTotal + sum(pollutantColumn)
        #runningCount <- runningCount + length(pollutantColumn)
    }
    #rawMean <- runningTotal / runningCount
    rawMean <- mean(pollutantColumns)
    round(rawMean, digits=3)
}