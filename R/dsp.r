.env <- new.env()
.env$port <- 22222

dsp.dev <- function(force.new=FALSE) {
  if (force.new && 'dsp' %in% ls(.env)) {
    close(get('dsp', .env))
    remove('dsp', envir=.env)
  }
  if (!('dsp' %in% ls(.env)))
    assign('dsp', file('/dev/dsp', open = 'w+b'), .env)
  get('dsp', .env)
}
dsp.socket.write <- function(force.new=FALSE) {
  if (force.new && 'socket.write' %in% ls(.env)) {
    close(get('socket.write', .env))
    remove('socket.write', envir=.env)
  }
  if (!('socket.write' %in% ls(.env))) {
    con <- socketConnection(port=get('port', .env),
                            server=TRUE, open='a+b')
    assign('socket.write', con, .env)
  }
  get('socket.write', .env)
}
dsp.socket.read <- function(force.new=FALSE, ...) {
  if (force.new && 'socket.read' %in% ls(.env)) {
    close(get('socket.read', .env))
    remove('socket.read', envir=.env)
  }
  if (!('socket.read' %in% ls(.env))) {
    con <- socketConnection(port=get('port', .env), blocking=FALSE,
                            server=FALSE, open='rb', ...)
    assign('socket.read', con, .env)
  }
  get('socket.read', .env)
}
play <- function(x, dsp) {
  writeBin(encode(x), dsp)
  flush(dsp)
}
