library(faraway)
data(trees)
attach(trees)
lm1 <- lm(log(Volume)~Girth+Height+I(Girth^2)+I(Height^2)+Girth:Height,data=trees)
summary(lm1)

lm2 <- lm(log(Volume)~Girth+Height+I(Girth^2)+I(Height^2),data=trees)
summary(lm2)

lm3 <- lm(log(Volume)~Girth+Height+I(Girth^2),data=trees)
summary(lm3)
step(lm1)
anova(lm1,lm3)


