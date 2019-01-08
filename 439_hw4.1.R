library(faraway)
data(sat)
attach(sat)
math.lm <- lm(math ~ expend + ratio + salary, data = sat)
#b
summary(math.lm)

#a
reduced1 <- lm(math ~ expend, data = sat)
anova(reduced1,math.lm)
#c
reduced2 <- lm(math ~ ratio + salary, data = sat)
anova(reduced2,math.lm)

#d
reduced3 <- lm(math ~ offset(10*expend) + ratio + salary, data = sat)
anova(reduced3,math.lm)

#e
reduced4 <- lm(math ~ expend + I(ratio - salary),data = sat)
anova(reduced4,math.lm)
