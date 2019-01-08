library(MPV)
data(table.b3)
attach(table.b3)
y.lm <- lm(y ~ x1 + x6)
summary(y.lm)
y.null <- lm(y ~ 1)
anova(y.null,y.lm)

summary(y.lm)$r.squared
summary(y.lm)$adj.r.squared

confint(y.lm,"x1",level = 0.95)

t.test(y,x1)
t.test(y,x6)

detach(table.b3)
