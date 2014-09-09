corr <- function(directory, threshold = 0) {    
    correlations <- vector(mode = "numeric", length = 0)
    monitorFiles <- list.files(path = directory, full.names = TRUE)
    
    for (monitor in monitorFiles) {
        currentData <- read.csv(monitor)
        completeCases <- complete.cases(currentData)
        completePollutants <- currentData[completeCases, ]
        if (nrow(completePollutants) <= threshold) {
            next
        }
        correlations <- append(correlations, cor(completePollutants$sulfate,
                                                 completePollutants$nitrate))
    }
    correlations
}