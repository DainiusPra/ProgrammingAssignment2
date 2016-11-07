## Put comments here that give an overall description of what your
## functions do

## Creates an environment for the matrix

makeCacheMatrix <- function(m = matrix()) {
    inv <- NULL
    set <- function(y) {
        m <<- y
        m <<- NULL
    }
    get <- function() m
    setinv <- function(solve) inv <<- solve
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## solves the matrix or chaches the solution (if it was solved 
## previously


cacheSolve <- function(m, ...){
    inv <- m$getinv()
    if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
    }
    data <- m$get()
    inv <- solve(data, ...)
    m$setinv(inv)
    inv
}
