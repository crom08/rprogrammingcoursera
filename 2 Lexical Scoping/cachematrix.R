## Put comments here that give an overall description of what your
## functions do

## This function: makeCacheMatrix, creates a special "matrix", which is really a
## list containing a function to
##     1. set the value of the matrix
##     2. get the value of the matrix
##     3. set the value of the inverse of the matrix
##     4. set the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}


## This function: cacheSolve, calculates the inverse of the special "matrix"
## created with the above function.  However, it checks to see if the inverse
## has already been calculated. If so, it gets the inverse of the matrix from
## the cache and skips the computation.  Otherwise, it calculates the inverse
## of the matrix and sets the value of the inverse of the matrix via the
## setInverse function.

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if (!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    ## Return a matrix that is the inverse of 'x'
    m
}
