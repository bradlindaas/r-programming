rankall <- function(outcome, num = "best") {
    ##read the sort function
    df <- data.frame(hospital=character(), state=factor())
    
    source("rankhospital.R")
    peek <-read.csv("outcome-of-care-measures.csv", 
                    colClasses = "character", 
                    na.strings="Not Available")
    peek[,7]<-(as.factor(peek[,7])) ## make State a factor
    validStates <- levels(peek[,7])
    
    for (state in validStates){
    
        stateData <- rankhospital(state, outcome, num)
        row <- data.frame(hospital = stateData, state = state)
        df <- rbind(df, row)
    }
    
    return(df)
}