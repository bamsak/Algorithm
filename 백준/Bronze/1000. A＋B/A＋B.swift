let result = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
print(result)