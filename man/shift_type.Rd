\name{shift_type}
\alias{shift_type}

\title{
  Determine abrupt shift type
}
\description{
  Takes a time series and output from the where_as() function to determine if the shift is a true abrupt shift, or if a flat section has been detected as an anomalous shift in an otherwise increasing or decreasing time series. It calculates this by checking if the gradient in a section of the time series around the detected shift is smaller than the time series overall.
}
\usage{
  shift_type(ts, where, dt=FALSE, width='tenth')
}
\arguments{
  \item{ts}{Time series that shift has been detected in.}
  \item{where}{Output from the where_as() function.}
  \item{dt}{Time step of the time series ts. As default is is FALSE but is used in calculations if supplied as a numerical value into the function. It must be supplied if it was used in the where_as() function.}
  \item{width}{The width of the section used to measure the gradient around the detected shift. Default is 'tenth' which will use 10 percent of the length of the time series. A numerical value can be supplied, which will be either in points, or time if dt is also supplied. Note user supplied values are not in percentages as the default is. The value of width is divided in half and the section used to measure the gradient around the detected tipping point is spread evenly across the detected position.}
}
\details{
  If the shift is detected near the beginning or the end of the time series such that the section length supplied by width cannot be fully fitted around the detected position, then it is fitted unevenly at a small length. For example, if a shift was detected at point 20, and the width=100, then the section tested for gradient would be 1 to 70 (the fit of 20 +/- 50). For now this function is set up to determine the shift type in time series where only one shift was detected.
}
\value{
  A value of 1 is returned if the function determines that a true abrupt shift has occurred, and 0 otherwise.
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

  shift_type(eg1$x, where1)   #true shift detected so '1' is returned
  shift_type(eg1$x, where1a, dt=0.5)  #dt needs to be specified if it has been in the where_as() function previously
  shift_type(eg1$x, where1, width=100)  #default width results in 200 (10 percent of length of eg1$x) but can be varied. In most cases here '1' will still be returned
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
