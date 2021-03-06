correl <- function (ams_stat_all){

sites_no <- NCOL(ams_stat_all)

correlmatrix <- matrix(NA,sites_no,sites_no)
novermatrix <- correlmatrix

# correlation calculation
for (j1 in 1:(sites_no-1)) {
  for (j2 in (j1+1):sites_no) {
    ams1 = ams_stat_all[,j1]
    ams2 = ams_stat_all[,j2]

    ams1_NA = !is.na(ams1)
    ams1_1 <- ams1[ams1_NA]
    ams2_1 <- ams2[ams1_NA]

    ams2_NA = !is.na(ams2_1)
    ams1_2 <- ams1_1[ams2_NA]
    ams2_2 <- ams2_1[ams2_NA]

    correlmatrix[j1,j2] = round(cor(ams1_2, ams2_2),4)

    novermatrix[j1,j2] = length(ams1_2)
      }
}

PREC$intermed$correlmat<-correlmatrix
PREC$intermed$novermat<-novermatrix

return(PREC$intermed)
}
