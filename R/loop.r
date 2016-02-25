# BITRATE = 8000 # per second
# BUFFER = 1/12 # seconds
options(digits.secs = 9)

#' @export
loop.service <- function(params, next.sample=NULL) {
  if (is.null(next.sample)) next.sample <- params$prev.sample
  next.time <- params$prev.time + length(next.sample) / params$bitrate

  if (next.time - (params$bitrate * params$buffer) < Sys.time()) {
    params$play(next.sample, params$out)
    params$prev.time <- next.time
  }
  params
}

#' @export
loop.new <- function(out, .bitrate=8000, .buffer=1/12, .play=play) {
  silence <- rep(0, .bitrate/2) # half second of silence
  params <- list(bitrate=.bitrate, buffer=.buffer, play=.play,
                 out=out, prev.time=Sys.time(), prev.sample=silence)
  loop.service(params, params$next.sample)
}
