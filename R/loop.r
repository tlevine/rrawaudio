options(digits.secs = 9)

#' @export
loop.service <- function(params, next.sample=NULL) {
  if (is.null(next.sample)) next.sample <- params$prev.sample

  next.time <- params$prev.time + length(next.sample) / params$bitrate
  almost.next.time <- next.time - params$buffer

  if (almost.next.time < Sys.time()) {
    writeBin(next.sample, params$out)
    params$prev.time <- max(next.time, Sys.time())
  }
  params
}


# bitrate = 8000 # per second
# buffer = 1/12 # seconds
#' @export
loop.new <- function(out, .bitrate=8000, .buffer=1/2) {
  silence <- rep(0, .bitrate/2) # half second of silence
  params <- list(bitrate=.bitrate, buffer=.buffer,
                 out=out, prev.time=Sys.time(), prev.sample=silence)
  loop.service(params, params$next.sample)
}
