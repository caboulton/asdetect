where_as <- function(ts, dt=NA, thresh=0.7) {

    inds <- which(abs(ts) > thresh)

    if (length(inds) > 0) {
        encoding <- rle(diff(inds))
        numtip <- length(which(encoding$length != 1))
        whichtip <- which(encoding$length != 1)
        tip_pos <- rep(NA, numtip)
        tip_prob <- rep(NA, numtip)

        for (k in 1:numtip) {
            if (k == 1) {
                if (ts[inds[1]] > 0) {tip_pos[k] <- inds[which.max(ts[inds[1:(encoding$length[1])]]+1)]}
                if (ts[inds[1]] < 0) {tip_pos[k] <- inds[which.min(ts[inds[1:(encoding$length[1])]]+1)]}
                tip_prob[k] <- ts[tip_pos[k]]
            } else {
                inds_temp <- inds[sum(encoding$length[1:(whichtip[k]-1)]):sum(encoding$length[1:whichtip[k]])+1]
                if (ts[inds_temp[1]] > 0) {tip_pos[k] <- inds_temp[which.max(ts[inds_temp])]}
                if (ts[inds_temp[1]] < 0) {tip_pos[k] <- inds_temp[which.min(ts[inds_temp])]}
                tip_prob[k] <- ts[tip_pos[k]]
                    }
                            }

        if (!is.na(dt)) {
            t <-rep(NA, length(ts))
            t[1] <- 0
            for (i in 2:length(t)) {
                t[i] <- t[i-1] + dt
                                    }
            tip_pos <- t[tip_pos]
                        }

        results <- list()
        results$as_pos <- tip_pos
        results$dt_val <- tip_prob
        return(results)
                            }

    if (length(inds) == 0) {
        results <- list()
        results$as_pos <- which.max(abs(ts))
        if (max(abs(ts)) == max(ts)) {results$dt_val <- max(ts)}
        if (-max(abs(ts)) == min(ts)) {results$dt_val <- min(ts)}
        print('Threshold not detected, maximum returned instead')
        return(results)
                            }
                                            }
