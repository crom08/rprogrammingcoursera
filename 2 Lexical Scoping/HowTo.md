---
title: "HowTo.md"
author: "Cromwell Ellamil"
date: "Friday, September 19, 2014"
output: html_document
---


This markdown document explains how to run/test the script I have created for
**R Programming Assignment 2**.

Please note that the sample printouts (or things that get printed into the output) 
are denoted by `#>`.


* Read the R script `cachematrix.R`.

```
source("cachematrix.R");
```

* Create the square matrix during the call to `makeCacheMatrix()`.

```
m <- makeCacheMatrix( matrix(c(5, 4, 3, 12, 14, 17, 18, 19, 2), 
                                nrow = 3, ncol = 3) );
```

* Check for functions available to matrix `m`.

```
summary(m);
#>            Length Class  Mode    
#> set        1      -none- function
#> get        1      -none- function
#> setInverse 1      -none- function
#> getInverse 1      -none- function
```

* Get the matrix

```
m$get();
#>      [,1] [,2] [,3]
#> [1,]    5   12   18
#> [2,]    4   14   19
#> [3,]    3   17    2
```

* Get the Inverse of matrix `m` using `cacheSolve(m)`.

```
cacheSolve(m);
#>             [,1]       [,2]        [,3]
#> [1,]  0.70405728 -0.6730310  0.05727924
#> [2,] -0.11694511  0.1050119  0.05489260
#> [3,] -0.06205251  0.1169451 -0.05250597
```

* Re-run `cacheSolve(m)` to check if the cached value was used.

```
cacheSolve(m);
#> getting cached inverse of matrix
#>             [,1]       [,2]        [,3]
#> [1,]  0.70405728 -0.6730310  0.05727924
#> [2,] -0.11694511  0.1050119  0.05489260
#> [3,] -0.06205251  0.1169451 -0.05250597
```
   
__Notice that the cached inverse of the matrix has been used in the above example.__

---

Alternatively, you may create the matrix by calling the `makeCacheMatrix` without
the arguments.  Just use the `set` function to create the matrix.


* Read the R script `cachematrix.R`.

```
source("cachematrix.R");
```

* Call `makeCacheMatrix()` function without arguments.

```
m <- makeCacheMatrix();
```

* Check for functions available to matrix `m`.

```
summary(m);
#>            Length Class  Mode    
#> set        1      -none- function
#> get        1      -none- function
#> setInverse 1      -none- function
#> getInverse 1      -none- function
```

* Create the square matrix using the `set` function.

```
m$set( matrix(c(5, 4, 3, 12, 14, 17, 18, 19, 2), 
                                nrow = 3, ncol = 3) );
```

* Verify that the square matrix has been created/set.

```
m$get();
#>      [,1] [,2] [,3]
#> [1,]    5   12   18
#> [2,]    4   14   19
#> [3,]    3   17    2
```

* Get the Inverse of matrix `m` using `cacheSolve(m)`.

```
cacheSolve(m);
#>             [,1]       [,2]        [,3]
#> [1,]  0.70405728 -0.6730310  0.05727924
#> [2,] -0.11694511  0.1050119  0.05489260
#> [3,] -0.06205251  0.1169451 -0.05250597
```

* Re-run `cacheSolve(m)` to check if the cached value was used.

```
cacheSolve(m);
#> getting cached inverse of matrix
#>             [,1]       [,2]        [,3]
#> [1,]  0.70405728 -0.6730310  0.05727924
#> [2,] -0.11694511  0.1050119  0.05489260
#> [3,] -0.06205251  0.1169451 -0.05250597
```

__Notice that the cached inverse of the matrix has also been used in the above example.__
