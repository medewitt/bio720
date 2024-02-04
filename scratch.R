binom.test(8,8, p =.5, "greater")
binom.test(7,8, p =.5, "greater")
binom.test(6,8, p =.5, "greater")

4 

1 * sqrt(8)


mean(rnorm(1000,8, 1 * sqrt(8))<0)

library(pwr)

o <- function(x){
    samp <- rbinom(1, size = x, prob = .75)
    samp
}

o(2)
prop.test(o(5), 4, correct = FALSE)

with(list(mu = 0.2, mu.alt = 0.75, alpha = 0.05, n = 8), (mean(sapply(rbinom(1e4, n, mu.alt), function(x) prop.test(x, n, mu, alternative = "greater")$p.value <= alpha))))

pbinom(4,5,.7)

mean(pbinom(rbinom(1000,10,.7),10,.7)>=.8)

pbinom(4,5, .7)
