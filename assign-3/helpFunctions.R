getValidStates <- function(data) {
    validStates <- levels(data$state)
    return(validStates)
}

readData <- function (
    fileLocation = "/srv/code/r-programming/assign-3/outcome-of-care-measures.csv") {
    #read data
    data <-read.csv(fileLocation, colClasses = "character", na.strings="Not Available")
    ## tidy the data
    data[,7]<-(as.factor(data[,7])) #make state a factor
    colnames(data)[c(2,7,11,17,23)] <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")   
    data<-data[complete.cases(data),] #drop NAs
    data[, c(11,17,23)] <- sapply(data[, c(11,17,23)], as.numeric) #convert outcomes to num
    data<-data[,c(2,7,11,17,23)] #get rid of columns we never use
    return(data)
}

getRank <- function (data, outcome, num = "best") {
    ## Format and check the num arg
    if (num == "best") {
        num <- 1
    } else if (num=="worst") {
        num <- nrow(data)
    } else if (num > nrow(data)) {
        ## Bad range, time to return NA and end the function
        return(NA)
    }    
    data[num,1]
}

validateOutcome <- function (outcome) {
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (outcome %in% outcomes) {
        TRUE
    } else {
        FALSE
    }
}

validateState <- function (state, data) {
    validStates <- getValidStates(data)
    if (state %in% validStates) {
        TRUE
    } else {
        FALSE
    }
}

sortByOutcome <- function (data, outcome) {
    data <- data[order(data[,3], data[,1]),]
    data <- data[order(data[,outcome], data[,"hospital"]),]
    data
}

extractByState <- function (data, state) {
    data <- data[data$state==state,]
    data
}

