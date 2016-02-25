library(devtools)
load_all()

if (!('d' %in% ls())) d <- dsp.dev()

W <- 2
H <- 1
major.scale <- cumsum(rep(c(W, W, H, W, W, W, H), 8))

song <- function(x) {
  sin(P.n(major.scale[round(4*x)] + 40) * x * 2 * pi) +
    sin(P.n(52) * x * 2 * pi)
}

play(scale.wave(wapply(4, song)), d)
