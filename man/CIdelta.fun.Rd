\name{CIdelta.fun}
\alias{CIdelta.fun}

\title{Confidence intervals  for   \eqn{\lambda(t)} using delta method}

\description{
Given the  \eqn{\hat \beta} covariance matrix (or its estimation),  an approximate
confidence interval for
 each \eqn{\lambda(t)} is calculated using  the  delta
method. }

\usage{CIdelta.fun(VARbeta, lambdafit, covariates, clevel = 0.95)}


\arguments{
  \item{VARbeta}{(Estimated) Covariance matrix of the \eqn{\hat \beta}  parameter vector.}

  \item{lambdafit}{Numeric vector of fitted values of the PP intensity  
\eqn{\hat \lambda(t)}.}

  \item{covariates}{Matrix of covariates to estimate the  PP intensity.}

  \item{clevel}{Confidence level of  the confidence intervals. A value in  the interval 
(0,1).}
}



\value{A list with  elements
  \item{LIlambda}{Numeric vector of the lower values of the intervals.}
  \item{UIlambda}{Numeric vector of the upper values of the intervals.}
  \item{lambdafit}{Input argument.}
}


\references{
Casella, G. and Berger, R.L., (2002). \emph{Statistical inference.} Brooks/Cole.

Cebrian, A.C., Abaurrea, J. and Asin, J. (2015). {NHPoisson}: An {R} Package for 
Fitting and Validating Nonhomogeneous Poisson Processes. 
\emph{Journal of Statistical Software}, 64(6), 1-24.

}

\note{\code{fitPP.fun} calls \code{CIdelta.fun} when the argument is \emph{CIty='Delta'}.}


\seealso{\code{\link{CItran.fun}}, \code{\link{fitPP.fun}}, \code{\link{VARbeta.fun}}
}

\examples{
aux<-CIdelta.fun(VARbeta=0.01, lambdafit=exp(rnorm(100)), covariates=matrix(rep(1,100)),
	 clevel=0.95)

}