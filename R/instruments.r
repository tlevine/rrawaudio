#' Generate a sawtooth wave.
#' @param frequency Frequency (440 is middle A.)
#' @param seconds The time dimension, a vector of times in seconds
sawtooth <- function(frequency, seconds)
  (frequency * seconds) %% 2 - 1
# saw_ (x,t) { return t%(1/x)*x*2-1 }

#' Generate a sine wave.
#' @param frequency Frequency (440 is middle A.)
#' @param seconds The time dimension, a vector of times in seconds
sine <- function(frequency, seconds)
  sin(frequency * seconds * 2 * pi)

#' Generate a triangle wave.
#' @param frequency Frequency (440 is middle A.)
#' @param seconds The time dimension, a vector of times in seconds
triangle <- function(frequency, seconds)
  abs(1 - seconds %% (1/frequency) * frequency * 2) * 2 - 1

#' Generate a square wave.
#' @param frequency Frequency (440 is middle A.)
#' @param seconds The time dimension, a vector of times in seconds
square <- function(frequency, seconds)
  ifelse((seconds * frequency %% 1) > 0.5, 1, -1)

#' Clamp a vector's values to be between -1 and 1.
#' @param a numeric vector
clamp <- function(x) pmax(-1, pmin(1, x))
