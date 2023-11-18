let result = readLine()!.split(separator: " ").map{Int($0)!}

print("\(result[0] - result[1])")