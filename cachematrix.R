## These functions return the inverse of a matrix by caching the inverse 
## and looking to return first the cached matrix if exists

## This function creates a special "matrix", which is really a list 
## containing a function to set and get the value and the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y, ...){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function returns the inverse of the special matrix created above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  ##x$setsolve(m)
  ##m
}
