best <- function(state, outcome) {
    
    ##read the sort function
    source("sort.R")
    data <- sort(state, outcome)
    data[1,1]
}
