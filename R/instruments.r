#' Generate a sawtooth wave.
#' @param frequency Frequency (440 is middle A.)
#' @param seconds Time dimension
sawtooth <- function(frequency, seconds) (frequency * seconds) %% 2 - 1

#' Generate a sine wave.
#' @param frequency Frequency (440 is middle A.)
#' @param seconds Time dimension
sine <- function(frequency, seconds) sin(frequency * seconds * 2 * pi)
