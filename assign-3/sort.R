sort <- function(state, outcome) {
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
    
    ## Check that state and outcome are valid
    if (state %in% validStates) {} else {
        stop("invalid state")
    }
    if (outcome %in% validOutcomes) {} else{
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    ## First, let's subset the data
    ## this is a bit clumsy, but it does the trick
    if (outcome == "heart attack") {
        data <- data[data[,7]==state,c(2,7,11)]
    } else if (outcome == "heart failure") {
        data <- data[data[,7]==state,c(2,7,17)]
    } else if (outcome == "pneumonia") {
        data <- data[data[,7]==state,c(2,7,23)]
    } else {
        stop("something went wrong in subsetting")
    }
    
    ## Next, let's get rid of "Not Available" cases
    data<-data[complete.cases(data),]
    
    ## Next, transform outcomes is a numeric to allow sorting
    data[,3]<-as.numeric(data[,3])
    
    ## Next, let's sort by outcome, then by name
    data <- data[order(data[,3], data[,1]),]
    
    ##finally, let's return the dataframe
    data
}
