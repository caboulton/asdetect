tip_eg <- function(tend=1000, tiploc=900, s=0.1, dt=0.5) {
    len <- tend/dt

    t <- rep(NA, len)
    t[1] <- 0
    for (i in 2:len) {
        t[i] <- t[i-1] + dt
                    }

    mu <- 2*sqrt(3)/9
    m <- t*mu/tiploc

    x <- rep(NA, len)
    x[1] <- -1
    for (i in 2:len) {
        x[i] <- x[i-1] + dt*(-x[i-1]^3+x[i-1]+m[i]) + sqrt(dt)*rnorm(1, sd=s)
                    }

    result <- data.frame(t=t,x=x)
    return(result)
                                                        }
