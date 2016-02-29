# Adapted from Javascript
# http://studio.substack.net/collision?time=1454555713931

collision <- function (.t) {
  # Parameters
  melody <- c(3,3,-1,-1,8,9,5,5,5,5,6)
  phase <- c(.07,.11,.04,.08,.13,.03)
  base <- c(1,-5,2,8)
  tempo <- 72/60

  # Local instruments
  t <- .t * tempo
  saw <- curry(sawtooth, t)
  sin <- curry(sine, t)
  tri <- curry(triangle, t)
   sq <- curry(square, t)
  saw_ <- sawtooth
  sin_ <- sine
  tri_ <- triangle
   sq_ <- square

  m <- 2^melody[floor(t)%%length(melody)]/12
  n <- 2^melody[floor(t/2)%%length(melody)]/12
  p <- phase[floor(t/8)%%length(phase)]
  b <- 2^base[floor(t)%%length(base)]/12

  sin_(2000+sin(1/4)*8*(3+sin(1/8))/4,t%%4/8+1)
    * (1-sq(6))/2 * sin_(240+sin(200),t%%4/8+sin(400)/8/8/4)
    * (1-saw(4)*0.6-saw(2)*0.3-saw_(1,t-0.05)*0.4)/2 * 0.3 +
  (sin_(200.41*m+tri(200.62*m)*4,t%%1/8/4+p)
    * 0.4+saw(200.15*m)*0.1+saw(199.85*m)*0.1) * 0.6 +
  tri_(tri_(tri(100*n)/8,t%%1/8+.2),t*2%%2/4+4)
    * (1-saw(2)*0.3-saw(1/2)*0.6)/2 * 0.8 +
  tri_(tri_(tri(600.29*b)/8,t%%2/4+.2),t%%1/2+.6+p) +
    * (1-saw(1/2))/2 * 0.4
}
