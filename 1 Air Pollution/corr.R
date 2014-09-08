corr <- function(directory, threshold = 0) {    
    correlations <- vector(mode = "numeric", length = 0)
    monitorFiles  <- list.files(path=directory, full.names = TRUE)
    
    for (monitor in monitorFiles) {
        currentData <- read.csv(monitor)
        completeSulfate <- currentData[!is.na(currentData$sulfate), ]
        completePollutants <- completeSulfate[!is.na(completeSulfate$nitrate), ]
        if (nrow(completePollutants) <= threshold) {
            next
        }
        correlations <- c(correlations, round(cor(completePollutants$sulfate, 
                                                  completePollutants$nitrate), 
                                              digits = 5))
    }
    options(digits = 4)
    correlations
}