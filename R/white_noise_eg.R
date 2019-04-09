white_noise_eg <- function(tend=1000, s=0.1, dt=0.5, end=0) {
    len <- tend/dt

    t <- rep(NA, len)
    t[1] <- 0
    for (i in 2:len) {
        t[i] <- t[i-1] + dt
                    }

    d <- end/tend

    x <- rep(NA, len)
    x[i] <- 0
    for (i in 2:len) {
        x[i] <- d*t[i] + sqrt(dt)*rnorm(1, sd=s)
                      }

    result <- data.frame(t=t,x=x)
    return(result)
                                                            }
