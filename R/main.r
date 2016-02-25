#' @param pagesize Set this to a factor of the loop length.
player <- function(pagesize=1000) {
  d <- dsp.dev()
  s <- dsp.socket.read(timeout=0.5) # timeout in seconds

  while (TRUE) writeBin(readBin(s, 'raw', pagesize), d)
}
