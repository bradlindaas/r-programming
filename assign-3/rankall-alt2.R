rankall <- function(outcome, num = "best") {
    
    ## Read outcome data
    ## [,2] is the Hospital Name
    ## [,7] is state
    ## [,11] is mortality rate of heart attack
    ## [,17] is mortality rate of heart failure
    ## [,23] is mortality rate of pneumonia
    
    data <-read.csv("outcome-of-care-measures.csv", 
                    colClasses = "character", 
                    na.strings="Not Available")
    data[,7]<-(as.factor(data[,7])) ## make State a factor
    validStates <- levels(data[,7])
    validOutcomes <- c("heart attack", "heart failure", "pneumonia")
    colnames(data)[c(11,17,23)] <- validOutcomes
    df <- data.frame(hospital=character(), state=factor(), outcome=character())
    ## Check that outcome is valid

    if (outcome %in% validOutcomes) {} else{
        stop("invalid outcome")
    }
    
    
    if (outcome == "heart attack") {
        data <- data[,c(2,7,11)]
    } else if (outcome == "heart failure") {
        data <- data[,c(2,7,17)]
    } else if (outcome == "pneumonia") {
        data <- data[,c(2,7,23)]
    } else {
        stop("something went wrong in subsetting")
    }
    
    ## Next, let's get rid of "Not Available" cases
    ## Next, let's sort by outcome, then by name
    

    for (state in validStates){
        stateData <- data[data[,2]==state,]
        stateData <- stateData[complete.cases(stateData),]
        stateData <- stateData[order(stateData[,3], stateData[,1]),]
        #num <- 1
        row <- data.frame(hospital = stateData[num,1], state = state, outcome=stateData[num,3])
        df <- rbind(df, row)
        
    }
    
    print(df)
}
