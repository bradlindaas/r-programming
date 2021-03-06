best <- function(state, outcome) {    
    source("helpFunctions.R")
    
    data <- readData()
    
    ## Validate args
    if (validateOutcome(outcome) == FALSE) stop("invalid outcome") 
    if (validateState(state, data) == FALSE) stop("invalid state")
    
    ## process the data
    data <- extractByState(data, state)
    data <- sortByOutcome(data, outcome)
    getRank(data=data, outcome=outcome, num="best")
}