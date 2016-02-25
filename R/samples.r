A4.flat <- sin(440 * (1:12000) * 2 * pi / 8000)
normal.volume <- dnorm(3 * 2 * ((1:12000) - (12000/2))/12000)
A4 <- A4.flat * normal.volume / max(normal.volume)
