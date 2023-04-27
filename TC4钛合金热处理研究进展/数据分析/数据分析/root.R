library(echarts4r)

df <- data.frame(
  x = seq(50),
  y = rnorm(50, 10, 3),
  z = rnorm(50, 11, 2),
  w = rnorm(50, 9, 2)
)

df |> 
  e_charts(x) |> 
  e_line(z) |> 
  e_area(w) |> 
  e_title("Line and area charts")