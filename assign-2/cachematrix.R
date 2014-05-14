## Two functions to cache the calculation of an inverted matrix
## to use, first create a matrix
## matrix <- matrix (sample(9), 3, 3)
## then store the matrix is a 'makeCacheMatrix' object
## stored <- makeCacheMatrix(matrix)
## then solve the inverted matrix
## cacheSolve(stored)
## if you solve it a second time, the function sees a cached response


## this is a function that constructs a storage object

makeCacheMatrix <- function(x = matrix()) {
    i = NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinvert <- function(invert) i <<- invert
    getinvert <- function() i
    list(set = set, get = get,
         setinvert = setinvert,
         getinvert = getinvert)
}


## this is a function that solved a matrix inversion, checking the cache first

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
