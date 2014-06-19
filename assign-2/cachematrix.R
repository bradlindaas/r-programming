## Two functions to cache the calculation of an inverted matrix
## to use, first create a matrix
## matrix <- matrix (rnorm(9), 3, 3)
## then store the matrix is a 'makeCacheMatrix' object
## stored <- makeCacheMatrix(matrix)
## then solve the inverted matrix
## cacheSolve(stored)
## if you solve it a second time, the function sees a cached response


## this is a function that constructs a storage object
makeCacheMatrix <- function(x = matrix()) {
    
    ## initialize the invert holder
    i = NULL
    ##function to set (store) the matrix
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    ##function to retreive the matrix
    get <- function() x
    ##function to set (store) the solution to inverted matrix
    setinvert <- function(invert) i <<- invert
    ##function to reteive the solution
    getinvert <- function() i
    ##return a list of the functions/values
    list(set = set, get = get,
         setinvert = setinvert,
         getinvert = getinvert)
}


## This function solved the inverted matrix, but checks cache first
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x' 
    ## check to see if there is a cached inverted matrix
    ## if there is a cached answer, return it
    i <- x$getinvert()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    ## There is no cache, so grab the stored matrix
    data <- x$get()
    ## calculate the inverted matrix
    i <- solve(data, ...)
    ## store the solution in the cache
    x$setinvert(i)
    ## return the solution
    i
}