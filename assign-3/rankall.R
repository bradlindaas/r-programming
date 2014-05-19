rankall <- function(outcome, num = "best") {
    source("helpFunctions.R")
    data <- readData()
    
    ## validate args
    validStates<-getValidStates(data)
    if (validateOutcome(outcome) == FALSE) stop("invalid outcome")
    
    ## process data
    data <- sortByOutcome(data, outcome)
    splitData <- split(data,data$state)
    list <- lapply(splitData, getRank, outcome=outcome, num=num)    
    df <- do.call(rbind.data.frame, list)
    df <- cbind(df, validStates)
    names(df) <- c("hospital", "state")
    return(df)
}