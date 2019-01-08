library(faraway)
data("prostate")
attach(prostate)
#a
full <- lm(lpsa~.,data=prostate)

lm2 <- update(full,.~. - gleason)
summary(lm2)


lm3 <- update(lm2,.~. - lcp)
summary(lm3)


lm4 <- update(lm3,.~. - pgg45)
summary(lm4)


lm5 <- update(lm4,.~. - age)
summary(lm5)


lm6 <- update(lm5,.~. - lbph)
summary(lm6)


#b AIC
step(full)


#c
library(leaps)
b <- regsubsets(lpsa~.,data=prostate)
summary(b)


(rs<-summary(b))
par(mfrow=c(1,2))
plot(2:9, rs$adjr2, xlab="No. of Parameters",ylab="Adjusted R-squqre")
plot(b,scale="adjr2")

#d Cp
(rs<-summary(b))
par(mfrow=c(1,2))
plot(2:9, rs$cp, xlab="No. of Parameters",ylab="Cp Statistic")
plot(b,scale="Cp")

