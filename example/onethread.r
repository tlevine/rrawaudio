library(devtools)
load_all()

if (!('d' %in% ls())) d <- dsp.dev()

W <- 2
H <- 1


major.scale <- cumsum(c(0, rep(c(W, W, H, W, W, W, H), 8)))
I <- major.scale[1]
IV <- major.scale[4]
V <- major.scale[5]
chord <- c(1, 3, 5)
chord7 <- c(1, 3, 5, 7)

progression <- rep(c(I, IV, V), 8)

song <- function(base.pitch=52, speed=4, scale=major.scale)
  function(x) {
    measure <- floor(x*speed)
    the.pitch <- base.pitch + progression[measure%%4]
    sine(P.n(scale[round(speed*x)] + the.pitch), x) +
      sawtooth(P.n(the.pitch + 12), x) / 6
  }

the.song <- song(speed=3)
play(scale.wave(wapply(4, the.song)), d)
