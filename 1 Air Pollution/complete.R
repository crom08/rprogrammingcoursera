complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    completeCases <- data.frame();
    
    for (monitor in id) {
        monitorFile <- paste(sprintf("%03d", monitor), "csv", sep=".")
        monitorPath <- paste(directory, monitorFile, sep="/")
        currentData <- read.csv(monitorPath)
        completeSulfate <- currentData[!is.na(currentData$sulfate), ]
        completePollutants <- completeSulfate[!is.na(completeSulfate$nitrate), ]
        thisCase <- data.frame(id=monitor, nobs=nrow(completePollutants))
        completeCases <- rbind(completeCases, thisCase)
    }
    completeCases
}