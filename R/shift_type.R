shift_type <- function(ts, where, dt=FALSE, width='tenth') {

    if (width=='tenth') {
      w <- floor(length(ts)/20)
    } else {
      w <- floor(width/2)
            }

    if (dt==FALSE) {
      pos <- where$as_pos
    } else {
      pos <- where$as_pos/dt
      if (width!='tenth') {
          w <- w/dt
                          }
            }

    if (pos < w) {
        poss <- 1:(pos+w)
    } else if (pos > (length(ts)-w)) {
        poss <- (pos-w):length(ts)
    } else {
        poss <- (pos-w):(pos+w)
            }

    as_mod <- lm(ts[poss] ~ c(1:length(poss)))
    full_mod <- lm(ts ~ c(1:length(ts)))
    as_grad <- as_mod$coefficients[2]
    full_grad <- full_mod$coefficients[2]

    if (abs(as_grad) < abs(full_grad)) {
        marker <- 0
    } else {
        marker <- 1
            }
    return(marker)
                                                }
