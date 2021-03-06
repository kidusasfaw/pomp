% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workhorses.R
\docType{methods}
\name{rprocess}
\alias{rprocess}
\alias{rprocess,pomp-method}
\alias{rprocess-pomp}
\alias{rprocess,ANY-method}
\alias{rprocess,missing-method}
\title{rprocess}
\usage{
\S4method{rprocess}{pomp}(object, xstart, times, params, offset = 0L,
  ...)
}
\arguments{
\item{object}{an object of class \sQuote{pomp}, or of a class that extends \sQuote{pomp}.
This will typically be the output of \code{pomp}, \code{simulate}, or one of the \pkg{pomp} inference algorithms.}

\item{xstart}{an \code{nvar} x \code{nrep} matrix containing the starting state of the system.
Columns of \code{xstart} correspond to states;
rows to components of the state vector.
One independent simulation will be performed for each column.
Note that in this case, \code{params} must also have \code{nrep} columns.}

\item{times}{a numeric vector (length \code{ntimes}) containing times.
These must be in non-decreasing order.}

\item{params}{a \code{npar} x \code{nrep} matrix of parameters.
Each column is treated as an independent parameter set, in correspondence with the corresponding column of \code{xstart}.}

\item{offset}{integer; the first \code{offset} times in \code{times} will be discarded.}

\item{...}{additional arguments are ignored.}
}
\value{
\code{rprocess} returns a rank-3 array with rownames.
Suppose \code{x} is the array returned.
Then \preformatted{dim(x)=c(nvars,nrep,ntimes-offset),}
where \code{nvars} is the number of state variables (=\code{nrow(xstart)}),
\code{nrep} is the number of independent realizations simulated (=\code{ncol(xstart)}), and
\code{ntimes} is the length of the vector \code{times}.
\code{x[,j,k]} is the value of the state process in the \code{j}-th realization at time \code{times[k+offset]}.
The rownames of \code{x} must correspond to those of \code{xstart}.
}
\description{
\code{rprocess} simulates the process-model portion of partially-observed Markov process.
}
\details{
When \code{rprocess} is called, the first entry of \code{times} is taken to be the initial time (i.e., that corresponding to \code{xstart}).
Subsequent times are the additional times at which the state of the simulated processes are required.
}
\seealso{
Specification of the process-model simulator: \code{\link{rprocess_spec}}

Other pomp workhorses: \code{\link{dmeasure}},
  \code{\link{dprior}}, \code{\link{dprocess}},
  \code{\link{partrans}}, \code{\link{rinit}},
  \code{\link{rmeasure}}, \code{\link{rprior}},
  \code{\link{skeleton}}, \code{\link{workhorses}}
}
\concept{pomp workhorses}
