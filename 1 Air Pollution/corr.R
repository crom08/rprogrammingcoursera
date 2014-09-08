corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    correlations <- vector(mode="numeric", length=0)
    monitorFiles  <- list.files(path=directory, full.names=TRUE)
    
    for (monitor in monitorFiles) {
        currentData <- read.csv(monitor)
        completeSulfate <- currentData[!is.na(currentData$sulfate), ]
        completePollutants <- completeSulfate[!is.na(completeSulfate$nitrate), ]
        if (nrow(completePollutants) <= threshold) {
            next
        }
        correlations <- c(correlations, round(cor(completePollutants$sulfate, 
                                                  completePollutants$nitrate), 
                                              digits=5))
    }
    options(digits = 4)
    correlations
}