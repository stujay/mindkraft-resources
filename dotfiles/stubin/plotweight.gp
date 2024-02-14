set title "Weight over Time"
set xlabel "Date"
set ylabel "Weight (kg)"
set xdata time
set timefmt "%Y-%m-%d"
set format x "%Y-%m-%d"
set xtics rotate by -45
set grid
set term pngcairo enhanced color
set output "weight_plot.png"
plot "-" using 1:2 with linespoints title "Weight"
