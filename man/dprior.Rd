% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workhorses.R
\docType{methods}
\name{dprior}
\alias{dprior}
\alias{dprior,pomp-method}
\alias{dprior-pomp}
\alias{dprior,ANY-method}
\alias{dprior,missing-method}
\title{dprior}
\usage{
\S4method{dprior}{pomp}(object, params, ..., log = FALSE)
}
\arguments{
\item{object}{an object of class \sQuote{pomp}, or of a class that extends \sQuote{pomp}.
This will typically be the output of \code{pomp}, \code{simulate}, or one of the \pkg{pomp} inference algorithms.}

\item{params}{a \code{npar} x \code{nrep} matrix of parameters.
Each column is treated as an independent parameter set, in correspondence with the corresponding column of \code{x}.}

\item{...}{additional arguments are ignored.}

\item{log}{if TRUE, log probabilities are returned.}
}
\value{
The required density (or log density), as a numeric vector.
}
\description{
Evaluates the prior probability density.
}
\seealso{
Specification of the prior density evaluator: \code{\link{prior_spec}}

Other pomp workhorses: \code{\link{dmeasure}},
  \code{\link{dprocess}}, \code{\link{partrans}},
  \code{\link{rinit}}, \code{\link{rmeasure}},
  \code{\link{rprior}}, \code{\link{rprocess}},
  \code{\link{skeleton}}, \code{\link{workhorses}}
}
\concept{pomp workhorses}
