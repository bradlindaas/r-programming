rankall <- function(outcome, num = "best") {
    source("helpFunctions.R")
    data <- readData()
    validStates<-getValidStates(data)
    if (validateOutcome(outcome) == FALSE) stop("invalid outcome")
    data <- sortByOutcome(data, outcome)
    splitData <- split(data,data$state)
    x <- lapply(splitData, getRank, outcome=outcome, num=num)
    i <- 0
    x <- lapply(x, function(x) {i=i+1 ; append(x, validStates[i])})
    x <- do.call(rbind, x)
    #x <- names(c("hospital", "state"))
    return(x)
}