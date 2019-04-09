\name{tip_eg}
\alias{tip_eg}

\title{
  Create a time series with an abrupt shift
}
\description{
  Abrupt shift time series is created using an equation that exhibits a bifurcation at the desired time, noting that stochastic noise will probably create the abrupt shift before this time. It uses the forward Euler scheme.
}
\usage{
  tip_eg(tend=1000, tiploc=900, s=0.1, dt=0.5)
}

\arguments{
  \item{tend}{The last value of time desired.}
  \item{tiploc}{The location of the tipping point or bifurcation.}
  \item{s}{The standard deviation of the stochastic noise in the system.}
  \item{dt}{The time step taken each time to resolve the system.}
}
\details{
}
\value{
  Returns a data frame with the following components:
  \item{t}{Time}
  \item{x}{Time series}
}
\references{
  Boulton C. A. & Lenton T. M. (2019) 'A method for detecting abrupt shifts in time series' (in prep.)
}
\author{
  Chris A. Boulton, University of Exeter
}
\note{
}

\seealso{
}
\examples{
eg1 <- tip_eg()   #creates a time series with an abrupt shift, going to t=1000 with a bifurcation at t=900
eg2 <- tip_eg(dt=0.1)   #create a similar time series to eg1 but more finely resolved
eg3 <- tip_eg(s=0.2)    #create a time series like eg1 but with more variability (likely to shift earlier by chance)
eg4 <- tip_eg(tiploc=500)   #create a time series where the shift occurs earlier
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
