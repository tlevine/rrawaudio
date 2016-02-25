.env <- new.env()
.env$port <- 22222

dsp.dev <- function(force.new=FALSE, block=TRUE) {
  if (force.new && 'dsp' %in% ls(.env)) {
    close(get('dsp', .env))
    remove('dsp', envir=.env)
  }
  if (!('dsp' %in% ls(.env)))
    assign('dsp', file('/dev/dsp', open = 'wb', blocking=block), .env)
  get('dsp', .env)
}
dsp.socket <- function(force.new=FALSE, block=TRUE) {
  if (force.new && 'socket' %in% ls(.env)) {
    close(get('socket', .env))
    remove('socket', envir=.env)
  }
  if (!('socket' %in% ls(.env))) {
    con <- socketConnection(port=get('port', .env), blocking=block,
                            open='a+b')
    assign('socket', con, .env)
  }
  get('socket', .env)
}
play <- function(x, dsp) writeBin(encode(x), dsp)
