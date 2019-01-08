library(MPV)
library(leaps)
data(table.b3)
attach(table.b3)
full <- lm(y ~ .,data = table.b3)
summary(full)
#a
b=regsubsets(y~.,data = table.b3,nbest = 1)
rs<-summary(b)
rs$cp
rs$adjr2
rs$rsq
rs$bic

#b
lm.cur <- lm(y~1)
add1(lm.cur,~x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11,test = "F")
lm.cur <- lm(y~x1)
add1(lm.cur,~x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11,test = "F")

step(full,direction = "both", test = "F")
lm.cur <- lm(y ~ x1 + x3 + x5 + x8 + x9 + x10)
lm.cur <- update(lm.cur,.~.-x8)
summary(lm.cur)
lm.cur <- update(lm.cur,.~.-x10)
summary(lm.cur)
lm.cur <- update(lm.cur,.~.-x5)
summary(lm.cur)
lm.cur <- update(lm.cur,.~.-x3)
summary(lm.cur)
lm.cur <- update(lm.cur,.~.-x9)
summary(lm.cur)
