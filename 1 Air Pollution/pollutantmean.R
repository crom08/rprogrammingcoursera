pollutantmean <- function(directory, pollutant, id = 1:332) {
    pollutantColumns <- c()
    
    for (monitor in id) {
        monitorFile <- paste(sprintf("%03d", monitor), "csv", sep=".")
        monitorPath <- paste(directory, monitorFile, sep="/")
        currentData <- read.csv(monitorPath)
        filteredData <- currentData[!is.na(currentData[pollutant]), ]
        pollutantColumn <- filteredData[[pollutant]]
        pollutantColumns <- c(pollutantColumns, pollutantColumn)
    }
    rawMean <- mean(pollutantColumns)
    round(rawMean, digits=3)
}