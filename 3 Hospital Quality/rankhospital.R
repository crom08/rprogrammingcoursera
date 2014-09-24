getMortalityRatesColNumFromOutcome <- function(outcome) {
    switch (outcome,
            "heart attack" = 11,
            "heart failure" = 17,
            "pneumonia" = 23
    )
}

rankhospital <- function(state, outcome, num = "best") {
    
    validOutcomes <- c("heart attack", "heart failure", "pneumonia");
    validRanks <- c("best", "worst");
    hospitalNameColNum <- 2;
    hospitalRank <- num;
    rankedHospital <- NA_character_;
    
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", 
                            colClasses = "character");
    
    ## Check that state, outcome and ranks are valid
    if (! is.element(state, outcomeData$State)) {
        stop("invalid state");
    }
    
    if (! is.element(outcome, validOutcomes)) {
        stop("invalid outcome");
    }
    
    if (! is.element(num, validRanks) && ! is.numeric(num)) {
        stop("invalid num");
    }
    
    ## Split the data according to state
    splitOutcome <- split(outcomeData, outcomeData$State);
    
    ## Get only data frame for the specified state
    stateOutcome <- as.data.frame(splitOutcome[state]);
    
    ## Get column name for specified mortality or outcome
    mortalityColNum <- getMortalityRatesColNumFromOutcome(outcome);
    
    ## Remove missing values in mortality column
    completeOutcome <- stateOutcome[! is.na(suppressWarnings(
        as.numeric(stateOutcome[, mortalityColNum]))), ];
    
    ## Sort according to mortality column, then hospital name in ascending order
    sortedOutcome <- completeOutcome[
            order(as.numeric(completeOutcome[, mortalityColNum]), 
                  as.character(completeOutcome[, hospitalNameColNum])), ]
    
    ## Validate if num is within the bounds
    if (is.numeric(num) && 
            (num < 1 || num > length(sortedOutcome[, hospitalNameColNum]))) {
        return(rankedHospital);
    }

    ## Map the worst and best ranks with their respective row numbers
    if (! is.numeric(num) && num == "worst") {
        hospitalRank <- length(sortedOutcome[, hospitalNameColNum]);
    }
    else if (! is.numeric(num) && num == "best") {
        hospitalRank <- 1;
    }
    
    ## Get only the hospital name in that specific rank
    rankedHospital <- sortedOutcome[hospitalRank, hospitalNameColNum];
    
    ## Return hospital name in that state with the given rank
    rankedHospital;
}