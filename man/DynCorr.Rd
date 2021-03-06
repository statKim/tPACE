% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DynCorr.R
\name{DynCorr}
\alias{DynCorr}
\title{Dynamical Correlation}
\usage{
DynCorr(x, y, t)
}
\arguments{
\item{x}{a n by m matrix where rows representing subjects and columns representing measurements, missings are allowed.}

\item{y}{a n by m matrix where rows representing subjects and columns representing measurements, missings are allowed.}

\item{t}{a length m vector of time points where x,y are observed.}
}
\value{
A length n vector of individual dynamic correlations. The dynamic correlation can be obtained by taking average of this vector.
}
\description{
Calculates the Dynamical Correlation for 2 paired dense regular functional data observed on the same grid.
}
\examples{
set.seed(10)
n=200             # sample size
t=seq(0,1,length.out=100)       # length of data
mu_quad_x=8*t^2-4*t+5
mu_quad_y=8*t^2-12*t+6
fun=rbind(rep(1,length(t)),-t,t^2)
z1=matrix(0,n,3)
z1[,1]=rnorm(n,0,2)
z1[,2]=rnorm(n,0,16/3)
z1[,3]=rnorm(n,0,4)
x1_quad_error=y1_quad_error=matrix(0,nrow=n,ncol=length(t))
for (i in 1:n){
  x1_quad_error[i,]=mu_quad_x+z1[i,]\%*\%fun+rnorm(length(t),0,0.01)
  y1_quad_error[i,]=mu_quad_y+2*z1[i,]\%*\%fun +rnorm(length(t),0,0.01)
}
dyn1_quad=DynCorr(x1_quad_error,y1_quad_error,t) 
}
\references{
\cite{Dubin J A, Müller H G. Dynamical correlation for multivariate longitudinal data (2005).  
Journal of the American Statistical Association 100(471): 872-881.}
\cite{Liu S, Zhou Y, Palumbo R, Wang, J.L. (2016).  Dynamical correlation: A new method for quantifying synchrony with 
multivariate intensive longitudinal data. Psychological methods 21(3): 291.}
}
