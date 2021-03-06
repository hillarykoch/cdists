rcwish <- function(n, Psi, nu, a, b) {
    d <- nrow(Psi)
    npairs <- choose(d, 2)
    if(n == 1) {
        crcwish(n, Psi, nu, a, b, npairs)[,,1]
    } else {
        crcwish(n, Psi, nu, a, b, npairs)
    }
}

rGwish <- function(n, Psi, nu, adj) {
    d <- nrow(Psi)
    npairs <- choose(d, 2)
    if(n == 1) {
        crgwish(n, Psi, nu, adj, npairs)[,,1]
    } else {
        crgwish(n, Psi, nu, adj, npairs)   
    }
}

rtmvn <- function(n, Sigma, mu, a, b) {
    samp <- crtmvn(n = n, Sigma = Sigma, mu = mu, a = a, b = b)
    sweep(samp, 2, mu, "+")
}

rtmvt <- function(n, Sigma, mu, nu, a, b) {
    scale_term <- sqrt(nu / rchisq(n, df = nu))
    samp <- crtmvt(n = n, Sigma = Sigma, mu = mu, nu = nu, a = a, b = b, scale_term = scale_term)
    sweep(samp, 2, mu, "+")
}


rwish <- function(n, Psi, nu) {
    d <- nrow(Psi)
    npairs <- choose(d, 2)
    if(n == 1) {
        cr_ordinary_wish(n, Psi, nu, npairs)[,,1]
    } else {
        cr_ordinary_wish(n, Psi, nu, npairs)
    }
}

rmvn <- function(n, Sigma, mu) {
    samp <- cr_ordinary_mvn(n = n, Sigma = Sigma, mu = mu)
    sweep(samp, 2, mu, "+")
}