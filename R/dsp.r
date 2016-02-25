.env <- new.env()
dsp <- function(force.new=FALSE, block=TRUE) {
  if (force.new && 'dsp' %in% ls(.env)) {
    close(get('dsp', .env))
    remove('dsp', envir=.env)
  }
  if (!('dsp' %in% ls(.env)))
    assign('dsp', file('/dev/dsp', open = 'wb', blocking=block), .env)
  get('dsp', .env)
}
play <- function(x, dsp) writeBin(encode(x), dsp)
