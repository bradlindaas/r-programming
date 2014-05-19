rankhospital <- function(state, outcome, num = "best") {
    source("sort.R")
    data <- sort(state, outcome)
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