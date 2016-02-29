BITRATE <- 8000

#' Partially apply a function.
#' @param f The function
#' @param ... Arguments to the function
curry <- function(f, ...) {
  curried.args <- list(...)
  function(...) do.call(f, append(curried.args, list(...)))
}

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
wapply <- function(seconds, f) {
  n <- round(seconds*BITRATE)
  f(rep(1:n, ceiling(seconds))[1:n]/BITRATE)
}

#' Generate frequencies in 12-tone equal temperment (12-TET)
#' @param n This note number
#' @param P.a Base frequency
#' @param a Base note number
#' @examples
#'   P.n(0)
#'   P.n(c(0, 2, 3))
P.n <- absolute.frequency <- function(n, P.a = 440, a = 0)
  P.a * (2^(1/12))^(n - a)
