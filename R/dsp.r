play <- function(x) {
  dsp <- file('/dev/dsp', open = 'a+b')
  writeBin(encode(x), dsp)
  close(dsp)
}
