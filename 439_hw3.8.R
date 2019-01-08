library(MPV)
data(table.b5)
attach(table.b5)
y.lm <- lm(y ~ x6 +x7)
summary(y.lm)


anova(y.lm)

summary(y.lm)$r.squared
summary(y.lm)$adj.r.squared

t.test(y,x6)
t.test(y,x7)

confint(y.lm,"x6",level = 0.95)
confint(y.lm,"x7",level = 0.95)

y.refit <- lm(y ~ x6)
summary(y.refit)
anova(y.refit)
summary(y.refit)$r.squared
summary(y.refit)$adj.r.squared

confint(y.refit,"x6",level=0.95)

detach(table.b5)
