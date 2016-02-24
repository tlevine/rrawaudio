# BITRATE = 8000 # per second
# BUFFER = 1/12 # seconds
options(digits.secs = 9)

#' @export
loop <- function(next.sample, prev.time=NULL, bitrate=8000, buffer=1/12,
                 out=NULL, play=play) {
  if (is.null(out)) out <- dsp()

  if (is.null(prev.time)) next.time <- Sys.time()
  else next.time <- prev.time + length(next.sample) / BITRATE

  if (next.time - (BITRATE * BUFFER) < Sys.time()) {
    play(next.sample, out)
    function(x) loop(x, prev.time=next.time, bitrate=bitrate,
                     buffer=buffer, out=out, play=play)
  }
}
