\name{where_as}
\alias{where_as}

\title{
  Determine where abrupt shift occurs
}
\description{
  Takes a detection time series as an input and determines where the maximum values above a given threshold value are.
}
\usage{
  where_as(ts, dt=NA, thresh=0.7)
}

\arguments{
  \item{ts}{Time series, most commonly a detection time series created from as_detect(). Any numerical vector will work.}
  \item{dt}{Time step of the time series. Default is NA.}
  \item{thresh}{The threshold value to look for maximum values in. It will also look for negative values such that their absolute value is above the threshold.}
}
\details{
}
\value{
  A list is returned comprising of the components:
  \item{as_pos}{The position(s) of the detected abrupt shifts. If dt is supplied, it will list the time rather than position.}
  \item{dt_val}{The detection value at the position or time of detection.}
  If the maximum value of the (absolute) time series is less than the threshold searched for, the maximum dectection value and corresponding position or time is returned, along with the message 'Threshold not detected, maximum returned instead' is printed.
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
  where1 <- where_as(detect1)     #determine where in the time series the detected abrupt shifts are
  where1a <- where_as(detect1, dt=0.5)    #same as where1 but returns the time rather than position of the detected shifts

  detect2 <- as_detect(eg1$x, dt=0.5) #detection time series with time included
  where2 <- where_as(detect2$detect)  #need to specify the detection time series in the data frame if dt is specified in as_detect()

}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
