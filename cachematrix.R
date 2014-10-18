## These Functions have been written for the Coursera R Programming Assignment no 2
## Sources used to create these functions are:
## Coursera - R-Progamming Course Material
## http://cran.r-project.org/ - R Help Files and reference guides
## http://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf - R for Beginners

## Computing the inverse of a square matrix can be done with the solve function in R. For example,
## if X is a square invertible matrix, then solve(X) returns its inverse.


## The first function is called "makeCacheMatrix" 
## This function creates a special "matrix" object that can cache its inverse

## The structure of the makeCacheMatrix function has been based on that of the "makeVector" function given
## in the example for this programming assignment

## This is the start of the makeCacheMatrix function and assigns the command function with an argument
## of x=matrix() to the "makeCacheMatrix" and will allow the call of the "matrix()" function when X is called

makeCacheMatrix <- function(x = matrix()) {

## Next to start the function "inv" is set as a variable for the inversed matrix
        
        inv <- NULL
        
## the next part of the function is to set the matrix by calling this part of the function "set"
## and assigning the "function" command with an argument of "matrix"

                set <- function(matrix) {

## Next x is set using the <<- operator to assign a value to an object in an environment 
## that is different from the current environment

                        x <<- matrix

## Next inv is set using the <<- operator to assign a value to an object in an environment 
## that is different from the current environment. In this case NULL is used

                        inv <<- NULL

## This is the end of the set function that has been created

                }

## The next task is to set the get the matrix by calling this part of the function "get" and
## then calls the expression of x. This is a short function so the {} brackets are not needed

                get <- function() x

## The next task is to then set the set inverse funtion
## This is a short function so the {} brackets are not needed
  
                setsolve <- function(solve) inv <<- solve

## THe next task is to then set the get inverse function
## This is a short function so the {} brackets are not needed

                getsolve <- function() inv

## The next lines set the valid options
               
                list(set = set, get = get,
                     setsolve = setsolve,
                     getsolve = getsolve)
 
       
## This is the end of the makeCacheMatrix function        

}



## ==============================================================================================




## The second function is called "cacheSolve" 
## This function creates a special "matrix" object that can cache its inverse
## cacheSolve: This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated (and the matrix
## has not changed), then cacheSolve should retrieve the inverse from the cache.



## The structure of the cacheSolve function has been based on that of the "cachemean" function given
## in the example for this programming assignment

## This is the start of the cacheSolve function to return a matrix that is the inverse of 'x'
## assigning the function name of "cacheSolve" - case important in the name

cacheSolve <- function(x, ...) {
        
## Get an inversed matrix using the objects set in the "makeCacheMatrix" function
## $ used to allow partial matches 
 
        inv <- x$getsolve()

## Returns the inverse if it is already set via an if statement

        if(!is.null(inv)) {
                
## Display a message to the user so that they are aware of a a wait period whilst data is retrieved
                
                message("getting cached data")
                
## Return the data to the screen

                return(inv)
        
## This is the end of if statement that has been created

        }
        
## Get the matrix and assign it to an attribute called "data"
## $ used to allow partial matches 

        data <- x$get()

## Use the solve function within R to call the attribute "data" to assign the inversed results to the "inv" attribute

        inv <- solve(data, ...)
        
## Sets the inverse to the attribute "inv" using the objects set in the "makeCacheMatrix" function
## $ used to allow partial matches 

        x$setsolve(inv)
                
## Lastly the function returns the value of the variable "inv" to the screen
        
        inv

## This is the end of the cacheSolve function          
}

## End of File
