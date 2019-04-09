\name{white_noise_eg}
\alias{white_noise_eg}

\title{
  Create a time series of white noise
}
\description{
  White noise time series is created with inputted time step and variance and a potential drift (starting from a mean of 0). Format is the same as tip_eg() and uses the forward Euler scheme.
}
\usage{
  white_noise_eg(tend=1000, s=0.1, dt=0.5, end=0)
}
\arguments{
  \item{tend}{The last value of time desired.}
  \item{s}{The standard deviation of the stochastic noise in the system.}
  \item{dt}{The time step taken each time to resolve the system.}
  \item{end}{The value of the mean of the system at tend. Default is set to 0 to keep the system stationary.}
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
  eg1 <- white_noise_eg()   #creates a time series of stationary white noise that runs to time point 1000 with a standard deviation of 0.1
  eg2 <- white_noise_eg(dt=0.1) #same as eg1 but more finely resolved
  eg3 <- white_noise_eg(sd=0.5) #creates a time series with larger variability
  eg4 <- white_noise_eg(end=2)  #creates a time series of white noise as eg1 that drifts linearly to 2 from 0 over the time span
  }

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
