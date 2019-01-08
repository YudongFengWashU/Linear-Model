x = c(1:50)
e = rnorm(50)

y1 = 1 + x + e
plot(lm(y1 ~ x))

y2 = 1 + x + x*e
plot(lm(y2 ~ x))

y3 = 1 + x + x^0.5*e
plot(lm(y3 ~ x))

y4 = 1 + cos(pi*x/25) + e
plot(lm(y4 ~ x))