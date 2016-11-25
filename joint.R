##anuario <- read.csv("~/anuario.csv", sep=";", colClasses=c(cod="character"),stringsAsFactors=FALSE, dec=",")

require(xlsx)
anuario<-read.xlsx2("~/anuario.xls", 1, as.data.frame=TRUE, header=TRUE, colClasses=c(cod="character"),stringsAsFactors=FALSE)

head(anuario)
head(anuario$cod)
class(anuario$cod)
library(foreign)
library(stringi)

spss<-read.spss("spss.sav", to.data.frame=TRUE)
spss[]<-lapply(spss, as.character)
spss$cod<-spss$Codine
spss$Codine<-NULL
spss$cod<-stri_trim(spss$cod)
spss$cod
class(spss$cod)


joindata2<-merge(spss, anuario, by.x="cod", by.y="cod")
head(joindata2)
dim(joindata2)

write.csv2(joindata2, file="completo.csv")
write.table(joindata2, file="completo.txt")
