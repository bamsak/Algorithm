let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let products = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
let pays = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0

for i in 0..<min(n, m) {
    result += products[i] - pays[i] > 0 ? products[i] - pays[i] : 0
}

print(result)
