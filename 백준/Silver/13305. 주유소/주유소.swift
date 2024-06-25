let n = Int(readLine()!)!
let distances = readLine()!.split(separator: " ").map { Int($0)! }
let prices = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
var minPrice = prices[0]

for i in 0..<distances.count {
    minPrice = min(minPrice, prices[i])
    result += minPrice * distances[i]
}

print(result)
