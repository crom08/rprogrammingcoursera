corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    correlations <- vector(mode="logical", length=0)
    
    testdataframe <- data.frame();
    monitorFiles  <- list.files(path=directory, full.names=TRUE)
    
    for (monitor in monitorFiles) {
        currentData <- read.csv(monitor)
        print(monitor)
        
        testdataframe <- rbind(testdataframe, currentData[is.na(currentData$), ])
    }
    
    nrow(testdataframe)
    
}