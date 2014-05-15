best <- function(state, outcome) {
    ## Read outcome data
    ## [,7] is state
    ## [,11] is mortality rate of heart attack
    ## [,17] is mortality rate of heart failure
    ## [,23] is mortality rate of pneumonia
    
    data <-read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[,7]<-(as.factor(data[,7])) ## make State a factor
    
    ## Check that state and outcome are valid
    validStates <- levels(data)
    
    if (state %in% levels(data[,7])) {} else {
        stop("invalid state")
    }
    
    
    
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}
