dsp <- function() file('/dev/dsp', open = 'wb')
play <- function(x, dsp) writeBin(U8(A4), dsp)
