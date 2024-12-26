data <- read.table("input.txt")
print(sum(abs(data[order(data$V1),]$V1 - data[order(data$V2),]$V2)))
