encode <- function(x) {
  if (any(is.na(x)) || min(x) < -1 || max(x) > 1)
    stop('You must normalize and remove NAs.')
  else
    as.raw(128 + floor(x*127.5))
}
