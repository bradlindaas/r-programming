rankall <- function(outcome, num = "best") {
    
    source("assign-3/helpFunctions.R")
    
    ## Validate args
    if (validateOutcome(outcome) == FALSE) stop("invalid outcome") 
    
    data <- readData()
    
    getRank(data=data, outcome=outcome, num=num)
}
