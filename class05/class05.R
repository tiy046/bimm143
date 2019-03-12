#' ---
#' title: "Class 5 Introduction to R Graph Design"
#' author: "Tingyi Yang"
#' date: "Jan 22nd, 2019"
#' output: github_document
#' ---
#' 
#' # Class 05 R graphics intro
#' This is some **bold** and *italic* text and `code`

# My first boxplot

x <- rnorm(1000,0)
boxplot(x)

#rnorm is executed first then boxplot

summary(x)
hist(x)
boxplot(x, horizontal = TRUE)

#' I have generated x and it has `length(x)`

#hands on session 2

y <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
plot(y, type="o", pch=15, cex=1.5, lwd=3, lty=3, ylim=c(2,10), xlab="Age(months)", ylab="Weight(kg)", main = "Weight with Age")

# try a barplot

barplot(VADeaths, beside=TRUE)
barplot(VADeaths, beside=FALSE)

#Input the feature count data

z<- read.table("bimm143_05_rstats/feature_counts.txt", sep = "\t", header = TRUE)
par(mar=c(5.1,12,4.1,2.1))
barplot(z$Count, horiz = TRUE, main ="mouse versus feature counts", las=2, xlim= c(0,80000), names.arg = z$Feature)

#

hist(c(rnorm(10000),rnorm(10000)+4), breaks = 80)

x1 <- c(rnorm(10000),rnorm(10000)+4)
hist(x1, breaks=80)

#section 3

m <- read.table("bimm143_05_rstats/male_female_counts.txt", header = TRUE, sep="\t")
par(mar=c(5.1,4,4.1,2.1))
barplot(m$Count, names.arg = m$Sample, las=2, col=rainbow(10), ylab="counts")

#all barplots need height!!!!!! it is m$Count this time

#
genes <- read.table("bimm143_05_rstats/up_down_expression.txt", header=TRUE, sep="\t")
#how many genes in the table
nrow(genes)
#how many up down and all round
table(genes$State)
#plot
palette(c("cyan", "magenta", "blue"))
plot(genes$Condition1,genes$Condition2,col=genes$State)


#
meth <- read.table("bimm143_05_rstats/expression_methylation.txt", header = TRUE, sep = "\t")
nrow(meth)
plot(meth$gene.meth, meth$expression)
#another way to read the table
meth2 <- read.delim("bimm143_05_rstats/expression_methylation.txt")
dencol <- densCols(meth$gene.meth, meth$expression)

plot(meth$gene.meth, meth$expression, col=dencol, pch=20)
inds <- meth$expression > 0
plot(meth$gene.meth[inds], meth$expression[inds])
