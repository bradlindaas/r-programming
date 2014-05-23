## "makeCacheMatrix" function will create and save a cached value of
## the inverse of a matrix.
## "cacheSolve" function will return the cached value of the inverse of
## a matrix if it exists and if it does not exist will calculate and
## cache the inverse.

## Put comments here that give an overall description of what your
## functions do

## "makeCacheMatrix" function will create and save a cached value of
## the inverse of a matrix. Inverted matrix will be calculated using
## function "solve".
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmatrix <- function(solve) m <<- solve #changed mean to solve
    getmatrix <- function() m
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}


## "cacheSolve" function will return the cached value of the inverse of
## a matrix if it exists and if it does not exist will calculate and
## cache the inverse using function "solve".
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...) #changed X to data
    x$setmatrix(m)
    return(m)   
}