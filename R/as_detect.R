as_detect <- function(ts, dt=NA, lowwl=5, highwl='default') {
    l <- length(ts)

    if (highwl == 'default') {
        higwl <- floor(l/3)
    } else {
        higwl <- highwl
            }

    tip_distrib <- rep(0, l)

    wls <- lowwl:higwl

    for (j in 1:length(wls)) {

	breaks <- l/wls[j]

	if (breaks != floor(breaks)) {
            remainder <- l - floor(breaks)*wls[j]
            ts_temp <- ts[(floor(remainder/2)+1):(floor(remainder/2)+floor(breaks)*wls[j])]
                                        }

        if (breaks == floor(breaks)) {
            remainder <- NA
            ts_temp <- ts
                                    }

	lm_coeffs <- array(NA, dim=c(breaks,2))

	for (i in 1:breaks) {
		lm_mod <- lm(ts_temp[1:wls[j]+((i-1)*wls[j])] ~ c(1:wls[j]))
		lm_coeffs[i,] <- lm_mod$coefficients
                            }

	outlier_ind_up <- which((lm_coeffs[,2] - median(lm_coeffs[,2]))/mad(lm_coeffs[,2]) > 3)
	outlier_ind_down <- which((lm_coeffs[,2] - median(lm_coeffs[,2]))/mad(lm_coeffs[,2]) < -3)

	if (is.na(remainder)) {
            for (k in outlier_ind_up) {tip_distrib[1:wls[j]+((k-1)*wls[j])] <- tip_distrib[1:wls[j]+((k-1)*wls[j])] + 1}
            for (k in outlier_ind_down) {tip_distrib[1:wls[j]+((k-1)*wls[j])] <- tip_distrib[1:wls[j]+((k-1)*wls[j])] - 1}
                                }

        if (!is.na(remainder)) {
            for (k in outlier_ind_up) {tip_distrib[(floor(remainder/2)+1)+1:wls[j]+((k-1)*wls[j])] <- tip_distrib[(floor(remainder/2)+1)+1:wls[j]+((k-1)*wls[j])] + 1}
            for (k in outlier_ind_down) {tip_distrib[(floor(remainder/2)+1)+1:wls[j]+((k-1)*wls[j])] <- tip_distrib[(floor(remainder/2)+1)+1:wls[j]+((k-1)*wls[j])] - 1}
                                }
                                }

    if (is.na(dt)) {
      result <-  tip_distrib/length(wls)
    } else {
      t <- rep(NA, length(tip_distrib))
      t[1] <- 0
      for (i in 2:length(t)) {
          t[i] <- t[i-1] + dt
                              }
      result <- data.frame(t=t,detect=tip_distrib/length(wls))
            }

    return(result)
}

