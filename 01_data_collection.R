install.packages("quantmod")
library(quantmod)

banks <- c("HDFCBANK.NS","ICICIBANK.NS","SBIN.NS","AXISBANK.NS",
           "KOTAKBANK.NS","BANKBARODA.NS","PNB.NS","INDUSINDBK.NS",
           "IDFCFIRSTB.NS","FEDERALBNK.NS","CANBK.NS","UNIONBANK.NS",
           "BANDHANBNK.NS","RBLBANK.NS","YESBANK.NS","AUBANK.NS",
           "IDBI.NS","IOB.NS","CENTRALBK.NS","UCOBANK.NS")

getSymbols(banks, from="2014-01-01", to="2024-12-31", src="yahoo")
