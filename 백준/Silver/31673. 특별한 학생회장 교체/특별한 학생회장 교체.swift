let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var total = array.reduce(0, +)
let mid = total / 2
var i = 0

for j in array {
    total -= j
    if total <= mid { break }
    i += 1
}

print(m / (i + 2))
