install.packages("ggplot2")
install.packages("BSDA")
library(ggplot2)
library(BSDA)
#1
x <- c(78,75,67,77,70,72,28,74,77)
y <- c(100,95,70,90,90,90,89,90,100)

#1a
selisih = y-x
sdev <- sd(selisih)
sdev

#1b
t.test(x, y, paired=TRUE)

#1c
t.test(x, y, mu=0, var.equal=TRUE)

#2a
# Setuju

#2b
tsum.test(
  mean.x=23500,
  s.x=3900,
  n.x=100,
  mu=20000,
  alternative="greater",
  var.equal=TRUE
)

#2c
# Kesimpulan yang didapatkan adalah rata-rata mobil lebih dari 20000 km/tahun

#3
bandung <- list("saham" = 19, "mean" = 3.64, "sd" = 1.67)
bali <- list("saham" = 27, "mean" = 2.79, "sd" = 1.32)

#3a
# H0: "Tidak ada perbedaan rata - rata antara Bandung dan Bali"
# H1: "Ada perbedaan rata - rata antara Bandung dan Bali"

#3b
tsum.test(
  n.x = bandung$saham,
  n.y = bali$saham,
  mean.x = bandung$mean,
  mean.y = bali$mean,
  s.x = bandung$sd,
  s.y = bali$sd,
  var.equal = TRUE,
  alternative = "two.sided",
)

#3c
qt(p = 0.05, df = 2, lower.tail = FALSE)

#4
nomor4 <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),header = TRUE, check.names = TRUE)
byGroup <- split(nomor4, nomor4$Group)
group1 <- byGroup$`1`
group2 <- byGroup$`2`
group3 <- byGroup$`3`

#4a
hist(group1$Length, xlim = c(16, 20))
hist(group2$Length, xlim = c(16, 20))
hist(group3$Length, xlim = c(16, 20))

#4b
bartlett.test(nomor4$Length, nomor4$Group)

#4c
model1 <- lm(nomor4$Length~nomor4$Group)
summary(model1)

#4e
av <- aov(Length ~ factor(Group), data = nomor4)
TukeyHSD(av)

#4f
ggplot(nomor4, mapping = aes(x = Group, y = Length, group = 1)) +  geom_boxplot()