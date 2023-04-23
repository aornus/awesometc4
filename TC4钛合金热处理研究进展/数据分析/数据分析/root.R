pmar <- par(mar = c(5.1, 4.1, 4.1, 6.1)) #改版画布版式大小
with(iris, scatter3D(x = Sepal.Length, y = Sepal.Width, z = Petal.Length,
                     pch = 21, cex = 1.5,col="black",bg="#F57446",
                     xlab = "x",
                     ylab = "y",
                     zlab = "zb", 
                     ticktype = "detailed",bty = "f",box = TRUE,
                     theta = 60, phi = 20, d=3,
                     colkey = FALSE)
)