\name{CalcRes.fun}
\alias{CalcRes.fun}

\title{Calculate NHPP residuals on overlapping intervals}

\description{This function calculates raw and scaled residuals of a NHPP based on 
 overlapping intervals. The scaled residuals can be Pearson or any other type of scaled residuals
defined by the function \eqn{h(t)}. }

\usage{CalcRes.fun(mlePP, lint, h = NULL, typeRes = NULL)}


\arguments{
  \item{mlePP}{An object of class \code{\link{mlePP-class}}; usually,
the output  from \code{\link{fitPP.fun}}.}

  \item{lint}{Length of the  intervals to calculate the residuals.}

  \item{h}{Optional. Weight function to calculate the scaled residuals. By default,  
Pearson residuals with \eqn{h(t)=1/\sqrt{\hat \lambda(t)}} are calculated.}

  \item{typeRes}{Optional. Label indicating the type of scaled residuals. By default,  
Pearson residuals  are calculated and label is 'Pearson'.}


}


\details{
The raw residuals are  based on the increments of 
the raw process \eqn{R(t)=N_t-\int_0^t\hat\lambda(u)du} 
in  overlapping  intervals  \eqn{(l_1, l_2)} centered on t:

\deqn{r'(l_1, l_2)=R(l_2)-R(l_1)=\sum_{t_i \in (l_1,l_2)}I_{t_i}-\int_{l_1}^{l_2} \hat \lambda(u)du.}

Residuals \eqn{r'(l_1, l_2)} are made 'instantaneous' dividing by the
length of the intervals (specified by the argument lint),
\eqn{r(l_1, l_2)=r'(l_1,l_2)/(l_2-l_1)}. A residual is calculated
for each time in the observation period.  


The function also calculates  the residuals scaled  with  the function \eqn{h(t)}

\deqn{r_{sca}(l_1, l_2)=\sum_{t_i \in (l_1,l_2)}h(t_i)-\int_{l_1}^{l_2}  h(u)\hat \lambda(u)du.}

By default,  Pearson residuals with \eqn{h(t)=1/\sqrt{\hat \lambda(t)}} are calculated.}

\value{A list with elements

  \item{RawRes}{Numeric vector of the raw residuals.}

  \item{ScaRes}{A list with elements ScaRes (vector of the scaled residuals) 
	and typeRes (name of the type of scaled residuals).}

  \item{emplambda}{Numeric vector of the empirical estimator of the PP intensity  on the 
considered intervals.}

  \item{fittedlambda}{Numeric vector of the   sum  of the intensities 
\eqn{\hat \lambda(t)}  on the considered intervals, divided by the length of the interval.}

  \item{lintV}{Numeric vector of the  exact length of each interval. 
The exact length is defined as the number of observations  in each interval used in the 
estimation (observations with inddat=1).}

  \item{lint}{Input argument.}


  \item{typeI}{Label indicating  the type  of intervals
	used to calculate the residuals, 'Overlapping'.}

  \item{h}{Input argument.}

  \item{mlePP}{Input argument.}
}



\references{

Abaurrea, J., Asin, J., Cebrian, A.C. and Centelles, A.
(2007). Modeling and forecasting extreme heat events in the central
Ebro valley, a continental-Mediterranean area. \emph{Global and
Planetary Change}, 57(1-2), 43-58.

Baddeley, A., Turner, R., Moller, J. and Hazelton, M. (2005).
Residual analysis for spatial point processes.
\emph{Journal of the Royal Statistical Society}, Series B 67,617-666.



Brillinger, D. (1994). Time series, point processes and hybrids. \emph{Can. J. Statist.},
22, 177-206.

Cebrian, A.C., Abaurrea, J. and Asin, J. (2015). {NHPoisson}: An {R} Package for 
Fitting and Validating Nonhomogeneous Poisson Processes. 
\emph{Journal of Statistical Software}, 64(6), 1-24.


Lewis, P. (1972). Recent  results in the statistical analysis of univariate point
processes. In \emph{Stochastic point processes} (Ed. P. Lewis), 1-54. Wiley.


}




\seealso{ \code{\link{unifres.fun}}, \code{\link{graphres.fun}}}

\examples{

X1<-rnorm(1000)
X2<-rnorm(1000)

modE<-fitPP.fun(tind=TRUE,covariates=cbind(X1,X2), 
	posE=round(runif(40,1,1000)), inddat=rep(1,1000),
	tim=c(1:1000), tit="Simulated example",start=list(b0=1,b1=0,b2=0),
	dplot=FALSE,modCI=FALSE,modSim=TRUE)


#Residuals, based on overlapping intervals of length 50, from the fitted NHPP modE  

ResE<-CalcRes.fun(mlePP=modE, lint=50)


}

