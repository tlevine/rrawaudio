#' @example scale.wave(rnorm(100))
scale.wave <- function(x)
  -1 + 2 * ((x - min(x)) / (max(x) - min(x)))

#' @example
#'   f <- function(t) sin(440 * t * 2 * pi / 8000)
#'   wapply(1.5, f)
#'
#'   # Without wapply
#'   A4 <- sin(440 * (1:12000) * 2 * pi / 8000)
#'   # With wapply
#'   A4.fun <- function(seconds) sin(440 * seconds * 2 * pi)
#'   A4 <- wapply(1.5, A4.fun)
wapply <- function(seconds, f, bitrate=8000) {
  n <- round(seconds*bitrate)
  f(rep(1:n, ceiling(seconds))[1:n]/bitrate)
}

#' Generate frequencies in 12-tone equal temperment (12-TET)
#' @param n This note number
#' @param P.a Base frequency
#' @param a Base note number
#' @examples
#'   P.n(40)
#'   P.n(c(40, 42, 43))
P.n <- absolute.frequency <- function(n, P.a = 440, a = 49)
  P.a * (2^(1/12))^(n - a)
