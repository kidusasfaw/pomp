% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dacca.R
\docType{data}
\name{dacca}
\alias{dacca}
\title{Model of cholera transmission for historic Bengal.}
\usage{
dacca(gamma = 20.8, eps = 19.1, rho = 0, delta = 0.02,
  deltaI = 0.06, clin = 1, alpha = 1, beta_trend = -0.00498,
  logbeta = c(0.747, 6.38, -3.44, 4.23, 3.33, 4.55),
  logomega = log(c(0.184, 0.0786, 0.0584, 0.00917, 0.000208, 0.0124)),
  sd_beta = 3.13, tau = 0.23, S_0 = 0.621, I_0 = 0.378, Y_0 = 0,
  R1_0 = 0.000843, R2_0 = 0.000972, R3_0 = 1.16e-07)
}
\arguments{
\item{gamma}{recovery rate}

\item{eps}{rate of waning of immunity for severe infections}

\item{rho}{rate of waning of immunity for inapparent infections}

\item{delta}{baseline mortality rate}

\item{deltaI}{cholera mortality rate}

\item{clin}{fraction of infections that lead to severe infection}

\item{alpha}{transmission function exponent}

\item{beta_trend}{slope of secular trend in transmission}

\item{logbeta}{seasonal transmission rates}

\item{logomega}{seasonal environmental reservoir parameters}

\item{sd_beta}{environmental noise intensity}

\item{tau}{measurement error s.d.}

\item{S_0}{initial susceptible fraction}

\item{I_0}{initial fraction of population infected}

\item{Y_0}{initial fraction of the population in the Y class}

\item{R1_0, R2_0, R3_0}{initial fractions in the respective R classes}
}
\value{
\code{dacca} returns a \sQuote{pomp} object containing the model, data, and MLE
parameters, as estimated by King et al. (2008).
}
\description{
\code{dacca} constructs a \sQuote{pomp} object containing census and cholera
mortality data from the Dacca district of the former British province of
Bengal over the years 1891 to 1940 together with a stochastic differential
equation transmission model.
The model is that of King et al. (2008).
The parameters are the MLE for the SIRS model with seasonal reservoir.
}
\details{
Data are provided courtesy of Dr. Menno J. Bouma, London School of Tropical
Medicine and Hygiene.
}
\examples{

plot(dacca())
## MLE:
coef(dacca())
plot(simulate(dacca()))

}
\references{
A. A. King, E. L. Ionides, M. Pascual, and M. J. Bouma,
Inapparent infections and cholera dynamics,
Nature, 454:877-880, 2008
}
\seealso{
Other pomp examples: \code{\link{blowflies}},
  \code{\link{gompertz}}, \code{\link{measles}},
  \code{\link{ou2}}, \code{\link{ricker}},
  \code{\link{rw2}}, \code{\link{sir_models}},
  \code{\link{verhulst}}

Other datasets: \code{\link{blowflies}},
  \code{\link{bsflu}}, \code{\link{measles}},
  \code{\link{parus}}
}
\concept{datasets}
\concept{pomp examples}
\keyword{datasets}
\keyword{models}
