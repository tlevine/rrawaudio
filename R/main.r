#' @param pagesize Set this to a factor of the loop length.
player <- function(pagesize=2000) {
  d <- dsp.dev()
  s <- dsp.socket.read()

  l <- loop.new(d)
  while (TRUE) {
    x <- readBin(s, 'raw', n=pagesize)
    print(length(x))
    loop.service(l, if (length(x) > 0) x else NULL)
    Sys.sleep(0.1)
  }
}

# controller <- function() {
#   s <- dsp.socket.write()
