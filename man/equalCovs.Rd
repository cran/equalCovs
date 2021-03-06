\name{equalCovs}
\alias{equalCovs}
\title{Testing the equality of two covariance matrices.}
\description{
R code for testing the equality of two covariance matrices, used in paper "Two sample tests for high dimensional covariance matrices".
}
\usage{
equalCovs(sam1, sam2, size1, size2)
}

\arguments{
  \item{sam1}{
First sample, it must be array with structure size1*p, p is the dimension of data.
}
  \item{sam2}{
Second sample, it must be array with structure size2*p, p is the dimension of data.
}
  \item{size1}{
sample size of first sample
}
  \item{size2}{
sample size of second sample
}
}

\value{
test statistics and p-values

\item{test_stat}{test statistics}
\item{pvalue}{p-values}

}

\author{
Jun Li and Song Xi Chen
}

\examples{
library(mvtnorm)
p<-700 # the dimension of multivariate

theta1<-2
theta2<-1
mat1<-diag(theta1,p-1)
mat2<-diag(theta1+theta1*theta2,p-1)
mat3<-diag(theta2,p-2)

mat1<-rbind(mat1,rep(0,p-1))
mat2<-rbind(mat2,rep(0,p-1))
mat3<-rbind(mat3,rep(0,p-2),rep(0,p-2))

mat1<-cbind(rep(0,p),mat1)
mat2<-cbind(rep(0,p),mat2)
mat3<-cbind(rep(0,p),rep(0,p),mat3)
sigma1<-mat1+t(mat1)+diag(1+theta1^2,p)
sigma2<-mat2+t(mat2)+mat3+t(mat3)+diag(1+theta1^2+theta2^2,p)

size1<-80
size2<-80
sam1<-rmvnorm(size1,runif(p,0,5),sigma1) # generate the samples
sam2<-rmvnorm(size2,runif(p,-3,3),sigma2)

equalCovs(sam1,sam2,size1,size2)
}

\keyword{covariance}
\keyword{matrices}