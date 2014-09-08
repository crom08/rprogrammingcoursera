complete <- function(directory, id = 1:332) {    
    completeCases <- data.frame();
    
    for (monitor in id) {
        monitorFile <- paste(sprintf("%03d", monitor), "csv", sep = ".")
        monitorPath <- paste(directory, monitorFile, sep = "/")
        currentData <- read.csv(monitorPath)
        completeSulfate <- currentData[!is.na(currentData$sulfate), ]
        completePollutants <- completeSulfate[!is.na(completeSulfate$nitrate), ]
        thisCase <- data.frame(id = monitor, nobs = nrow(completePollutants))
        completeCases <- rbind(completeCases, thisCase)
    }
    completeCases
}