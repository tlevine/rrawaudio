#' Play a sound
#' @export
#' @param x The sound, as a numeric vector with elements between -1 and 1
#'   and with bitrate of 8000, that is, 8000 elements per second.
play <- function(x) {
  dsp <- file('/dev/dsp', open = 'a+b')
  writeBin(encode(x), dsp)
  close(dsp)
}

encode <- function(x) {
  if (any(is.na(x)) || min(x) < -1 || max(x) > 1)
    stop('You must normalize and remove NAs.')
  else
    as.raw(128 + floor(x*127.5))
}
