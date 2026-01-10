library(quantmod)

banks <- c("HDFCBANK.NS","ICICIBANK.NS","SBIN.NS","AXISBANK.NS",
           "KOTAKBANK.NS","BANKBARODA.NS","PNB.NS","INDUSINDBK.NS",
           "IDFCFIRSTB.NS","FEDERALBNK.NS","CANBK.NS","UNIONBANK.NS",
           "BANDHANBNK.NS","RBLBANK.NS","YESBANK.NS","AUBANK.NS",
           "IDBI.NS","IOB.NS","CENTRALBK.NS","UCOBANK.NS")

getSymbols(banks, from="2014-01-01", to="2024-12-31", src="yahoo")

calc_cagr <- function(price){
  start <- as.numeric(first(price))
  end <- as.numeric(last(price))
  years <- 10
  (end/start)^(1/years) - 1
}

cagr <- sapply(banks, function(b){
  calc_cagr(Cl(get(b)))
})

cagr_df <- data.frame(Bank=banks, CAGR=round(cagr*100,2))

write.csv(cagr_df, "outputs/cagr_results.csv", row.names=FALSE)
