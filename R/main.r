#' @param pagesize Set this to a factor of the loop length.
player <- function(pagesize=1000) {
  d <- dsp.dev()
  s <- dsp.socket.read()

  l <- loop.new(d)
  while (TRUE) {
    x <- readBin(s, 'raw')
    loop.service(x, if (length(x) > 0) x else NULL)
  }
}

# controller <- function() {
#   s <- dsp.socket.write()
