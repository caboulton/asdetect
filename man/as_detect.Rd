\name{as_detect}
\alias{as_detect}

\title{
  Create detection time series
}
\description{
  Creates a detection time series for an inputted time series.
}
\usage{
  as_detect(ts, dt=NA, lowwl=5, highwl='default')
}

\arguments{
  \item{ts}{Time series to detect shifts in.}
  \item{dt}{Time step of the time series. Default is NA.}
  \item{lowwl}{Lowest window length used in algorithm.}
  \item{highwl}{Highest window length used in algorithm. If 'default' then highwl is set to 1/3 of the length of ts.}
}
\details{
}
\value{
  Returns a numeric array which is the detection time series, the same length as the inputted time series. If dt is supplied rather than kept as the default NA then a data fream is returned including:
  \item{t}{Time values}
  \item{detect}{Detection time series}
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
eg1 <- tip_eg()     #create a time series with an abrupt shift
detect1 <- as_detect(eg1$x)      #create detection time series of abrupt shift time series with default choice of maximum window
plot(eg1$t, detect1, type="l", main='Abrupt Shift', xlab='Time', ylab='Detection')     #plot the abrupt shift detection time series against time

eg2 <- white_noise_eg()     #create white noise time series
detect2 <- as_detect(eg2$x)     #create detection time series of white noise time series with default choice of maximum window
plot(eg2$t, detect2, type="l", main='White Noise', xlab='Time', ylab='Detection')     #plot the white noise detection time series against time

detect3 <- as_detect(eg1$x, dt=0.5, lowwl=20)   #create a detection time series using a higher lowest window length value whilst also supplying dt
plot(detect3, type="l", main='Abrupt Shift', xlab='Time', ylab='Detection')  #with dt supplied time does not need to be supplied in the plotting function
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
