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

# the.song <- song(speed=3)
the.song <- function(x) {
# sin((1+cos(3*x))*220*x*2*pi)
# sawtooth(220*(1+cos(x/3)), x)
}

# play(scale.wave(wapply(8, the.song)), d)

x <- seq(-4,4,0.00001)
play(sawtooth(P.n(12*(dnorm(x) / dnorm(0)),0), x+4), d)
