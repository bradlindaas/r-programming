df <- data.frame(runID = numeric(), test1=factor(), test2=factor())

for (i in 1:100) {

    matrix <- matrix (sample(25), 5, 5)
    
    source("assign-2/brad-cachematrix.R") #brad's script
    bradStored <- makeCacheMatrix(matrix)
    bradSolved<- cacheSolve(bradStored)
    brad2Solved<- cacheSolve(bradStored)
    
    source("assign-2/cachematrix.R") #james's script
    jdbStored <- makeCacheMatrix(matrix)
    jdbSolved<- cacheSolve(jdbStored)
    jdb2Solved<- cacheSolve(jdbStored)
    
    pass <- identical(jdbSolved, bradSolved)
    pass2 <- identical(jdb2Solved, brad2Solved)    
    row <- data.frame(runID = i, test1 = pass, test2 = pass2)
    df <- rbind(df, row)
}
summary(df)
