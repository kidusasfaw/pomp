##' Design matrices for pomp calculations
##'
##' These functions are useful for generating designs for the exploration of parameter space.
##' \code{sobolDesign} generate a Latin hypercube design based on the Sobol' low-discrepancy sequence.
##' \code{profileDesign} generates a data-frame where each row can be used as the starting point for a profile likelihood calculation.
##' \code{sliceDesign} generates points along slices through a specified point.
##'
##' The Sobol' sequence generation is performed using codes from the
##' \href{http://ab-initio.mit.edu/nlopt/}{\pkg{NLopt} library} by S. Johnson.
##'
##' @name design
##' @rdname design
##'
##' @param lower,upper named numeric vectors giving the lower and upper bounds
##' of the ranges, respectively.
##' @param \dots In \code{profileDesign}, additional arguments specify the
##' parameters over which to profile and the values of these parameters.
##'
##' In \code{sliceDesign}, additional numeric vector arguments specify the
##' locations of points along the slices.
##' @param nseq Total number of points requested.
##' @param nprof The number of points per profile point.
##' @param stringsAsFactors should character vectors be converted to factors?
##' @param center \code{center} is a named numeric vector specifying the point
##' through which the slice(s) is (are) to be taken.
##' @return \code{sobolDesign}
##'
##' \code{profileDesign} returns a data frame with \code{nprof} points per
##' profile point.  The other parameters in \code{vars} are sampled using
##' \code{sobol}.
##'
##' @author Aaron A. King
##'
##' @references
##' W. H. Press, S. A. Teukolsky, W. T. Vetterling, and B. P.
##' Flannery, Numerical Recipes in C, Cambridge University Press, 1992
##'
##' P. Bratley and B. L. Fox, Algorithm 659 Implementing Sobol's quasirandom
##' sequence generator, ACM Trans. Math. Soft. 14, 88--100, 1988.
##'
##' S. Joe and F. Y. Kuo, Remark on algorithm 659: Implementing Sobol's
##' quasirandom sequence generator ACM Trans. Math. Soft 29, 49--57, 2003.
##'
##' Steven G. Johnson, The \pkg{NLopt} nonlinear-optimization package,
##' \url{http://ab-initio.mit.edu/nlopt}
##'
##' @keywords design
##' @examples
##'
##' ## Sobol' low-discrepancy design
##' plot(sobolDesign(lower=c(a=0,b=100),upper=c(b=200,a=1),100))
##'
##' ## A one-parameter profile design:
##' x <- profileDesign(p=1:10,lower=c(a=0,b=0),upper=c(a=1,b=5),nprof=20)
##' dim(x)
##' plot(x)
##'
##' ## A two-parameter profile design:
##' x <- profileDesign(p=1:10,q=3:5,lower=c(a=0,b=0),upper=c(b=5,a=1),nprof=20)
##' dim(x)
##' plot(x)
##'
##' ## A single 11-point slice through the point c(A=3,B=8,C=0) along the B direction.
##' x <- sliceDesign(center=c(A=3,B=8,C=0),B=seq(0,10,by=1))
##' dim(x)
##' plot(x)
##'
##' ## Two slices through the same point along the A and C directions.
##' x <- sliceDesign(c(A=3,B=8,C=0),A=seq(0,5,by=1),C=seq(0,5,length=11))
##' dim(x)
##' plot(x)
##'
NULL
