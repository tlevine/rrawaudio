#' @param pagesize Set this to a factor of the loop length.
player <- function(pagesize=1000) {
  d <- dsp.dev()
  s <- dsp.socket.read()

  while (TRUE) writeBin(readBin(s, 'raw', pagesize), d)
}
