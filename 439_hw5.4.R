library(MPV)
data(table.b3)
attach(table.b3)
y.lm <- lm(y ~ x1 + x8, data = table.b3)
summary(y.lm)

plot(x1,x8)

H <- lm.influence(y.lm)$hat
H[which.max(H)]

plot(table.b3$x1,table.b3$x8,main='gasoline',xlab='x1',ylab='x8')
points(table.b3$x1[6],table.b3$x8[6],col='red')

rstandard(y.lm)
rstudent(y.lm)

shapiro.test(rstandard(y.lm))
shapiro.test(rstudent(y.lm))
