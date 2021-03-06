% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kalman.R
\docType{methods}
\name{kalman}
\alias{kalman}
\alias{enkf}
\alias{eakf}
\alias{enkf,ANY-method}
\alias{enkf,missing-method}
\alias{eakf,ANY-method}
\alias{eakf,missing-method}
\alias{enkf-data.frame}
\alias{enkf,data.frame-method}
\alias{enkf-pomp}
\alias{enkf,pomp-method}
\alias{eakf-data.frame}
\alias{eakf,data.frame-method}
\alias{eakf-pomp}
\alias{eakf,pomp-method}
\title{Ensemble Kalman filters}
\usage{
\S4method{enkf}{data.frame}(data, Np, h, R, params, rinit, rprocess, ...,
  verbose = getOption("verbose", FALSE))

\S4method{enkf}{pomp}(data, Np, h, R, ..., verbose = getOption("verbose",
  FALSE))

\S4method{eakf}{data.frame}(data, Np, C, R, params, rinit, rprocess, ...,
  verbose = getOption("verbose", FALSE))

\S4method{eakf}{pomp}(data, Np, C, R, ..., verbose = getOption("verbose",
  FALSE))
}
\arguments{
\item{data}{either a data frame holding the time series data,
or an object of class \sQuote{pomp},
i.e., the output of another \pkg{pomp} calculation.}

\item{Np}{the number of particles to use.}

\item{h}{function returning the expected value of the observation given the
state.}

\item{R}{matrix; variance of the measurement noise.}

\item{params}{optional; named numeric vector of parameters.
This will be coerced internally to storage mode \code{double}.}

\item{rinit}{simulator of the initial-state distribution.
This can be furnished either as a C snippet, an \R function, or the name of a pre-compiled native routine available in a dynamically loaded library.
Setting \code{rinit=NULL} sets the initial-state simulator to its default.
For more information, see \link[=rinit_spec]{here}.}

\item{rprocess}{simulator of the latent state process, specified using one of the \link[=rprocess_spec]{rprocess plugins}.
Setting \code{rprocess=NULL} removes the latent-state simulator.
For more information, \link[=rprocess_spec]{see the documentation on these plugins}.}

\item{...}{additional arguments supply new or modify existing model characteristics or components.
See \code{\link{pomp}} for a full list of recognized arguments.

When named arguments not recognized by \code{\link{pomp}} are provided, these are made available to all basic components via the so-called \dfn{userdata} facility.
This allows the user to pass information to the basic components outside of the usual routes of covariates (\code{covar}) and model parameters (\code{params}).
See the \link[=userdata]{userdata documentation here} for information on how to use this facility.}

\item{verbose}{logical; if \code{TRUE}, diagnostic messages will be printed to the console.}

\item{C}{matrix converting state vector into expected value of the
observation.}
}
\value{
An object of class \sQuote{kalmand_pomp}.
}
\description{
The ensemble Kalman filter and ensemble adjustment Kalman filter.
}
\references{
Evensen, G. (1994) Sequential data assimilation with a
nonlinear quasi-geostrophic model using Monte Carlo methods to forecast
error statistics Journal of Geophysical Research: Oceans 99:10143--10162

Evensen, G. (2009) Data assimilation: the ensemble Kalman filter
Springer-Verlag.

Anderson, J. L. (2001) An Ensemble Adjustment Kalman Filter for Data
Assimilation Monthly Weather Review 129:2884--2903
}
\seealso{
Other \pkg{pomp} parameter estimation methods: \code{\link{abc}},
  \code{\link{bsmc2}}, \code{\link{mif2}},
  \code{\link{nlf}}, \code{\link{pmcmc}},
  \code{\link{pomp2-package}}, \code{\link{probe.match}},
  \code{\link{spect.match}}
}
\author{
Aaron A. King
}
\concept{\pkg{pomp} parameter estimation methods}
\concept{particle filtering methods}
