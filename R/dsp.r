.env <- new.env()
dsp <- function() {
  if (!('dsp' %in% ls(.env)))
    assign('dsp', file('/dev/dsp', open = 'wb'), .env)
  get('dsp', .env)
}
play <- function(x, dsp) writeBin(encode(x), dsp)
