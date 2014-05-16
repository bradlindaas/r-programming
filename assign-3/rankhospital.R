rankhospital <- function(state, outcome, num = "best") {
    ## Read in the best.R file
    source("sort.R")
   
    data <- sort(state, outcome)
   
    ## format some num values
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
