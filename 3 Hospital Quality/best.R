getMortalityRatesColNumFromOutcome <- function(outcome) {
    switch (outcome,
        "heart attack" = 11,
        "heart failure" = 17,
        "pneumonia" = 23
    )
}

best <- function(state, outcome) {
    
    validOutcomes <- c("heart attack", "heart failure", "pneumonia");
    
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", 
                        colClasses = "character");
    
    ## Check that state and outcome are valid
    if (! is.element(state, outcomeData$State)) {
        stop("invalid state");
    }
    
    if (! is.element(outcome, validOutcomes)) {
        stop("invalid outcome");
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    splitOutcome <- split(outcomeData, outcomeData$State);
    stateOutcome <- as.data.frame(splitOutcome[state]);
    mortalityColNum <- getMortalityRatesColNumFromOutcome(outcome);
    
    
    completeOutcome <- stateOutcome[! is.na(suppressWarnings(
        as.numeric(stateOutcome[, mortalityColNum]))), ];
    
    bestHospitals <- completeOutcome[
        as.numeric(completeOutcome[, mortalityColNum]) == 
            min(as.numeric(completeOutcome[, mortalityColNum]), 
                na.rm = TRUE), 2];
    
    if (length(bestHospitals) > 1) {
        bestHospitals <- sort(bestHospitals, method = "quick");
    }
    bestHospitals;
}