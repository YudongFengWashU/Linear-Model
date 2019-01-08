library(faraway)
data(longley)
attach(longley)
lm1 <- lm(Employed ~ GNP.deflator + GNP + Unemployed + Armed.Forces + Population + Year)
summary(lm1)
model.matrix(lm1)[,-1]
X <- model.matrix(lm1)[,-1]

lamda_1 = max(eigen(t(X)%*%X)$values)
lamda_p = min(eigen(t(X)%*%X)$values)
con_num = (lamda_1/lamda_p)^0.5
con_num

round(cor(longley),3)

vif(X)
