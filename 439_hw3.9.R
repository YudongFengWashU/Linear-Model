library(MPV)
data(table.b11)
attach(table.b11)
y.lm <- lm(Quality ~ Clarity + Aroma + Body + Flavor + Oakiness)
summary(y.lm)

y.null <- lm(Quality ~ 1)
anova(y.lm)

t.test(Quality,Clarity)
t.test(Quality,Aroma)
t.test(Quality,Body)
t.test(Quality,Flavor)
t.test(Quality,Oakiness)

summary(y.lm)$r.squared
summary(y.lm)$adj.r.squared

y.refit <- lm(Quality ~ Aroma + Flavor)
summary(y.refit)
summary(y.refit)$r.squared
summary(y.refit)$adj.r.squared

confint(y.lm,"Flavor",level = 0.95)
confint(y.refit,"Flavor",level = 0.95)

detach(table.b11)
