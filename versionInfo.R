# versionInfo.R

# This should be run in the RStudio console.  It saves version informmation for
# an Rmd troubleshooting effort.  I was not able to get RStudio.Version() to
# knit, so this script had to be written separately to be executed in the
# console.

verFile     <- "versionInfo.csv"
doneBefore  <- F
gotVerFile  <- file.exists(verFile)
packsNeeded <- readLines("packs.txt")
os                        <- sub("Windows 7"   , "7,"       , win.version())
if (!grepl("x64", os)) os <- sub("7,"          , "7, 32-bit", os           )
os                        <- sub("Service Pack", "SP"       , os           )

verData     <- c(Windows = os,
                 R       = sub("R version ", "", R.version.string),
                 RStudio = paste( RStudio.Version()$version, collapse="." ),
                 installed.packages(noCache=T)[packsNeeded,3]
                 )
if ( gotVerFile ) {
   savedVerDat <- read.table(verFile, sep=",", row.names=1, colClasses="character")
   for ( i in 1:ncol(savedVerDat) ) {
      doneBefore <- doneBefore | all(verData==savedVerDat[,i])
   }
}
if (!doneBefore) {
   newVerDat <- if (gotVerFile) cbind(savedVerDat, verData) else verData
   write.table(newVerDat, verFile, sep=",", col.names=F)
}