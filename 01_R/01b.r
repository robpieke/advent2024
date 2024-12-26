data <- read.table("input.txt")
print(sum(apply(data, MARGIN=1, function(d) d[1] * sum(data$V2 == d[1]))))