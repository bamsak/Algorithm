let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0

for i in ((n + 1) / 2..<n).reversed() {
    result += array[i] * 2
}

if n % 2 == 1 {
    result += array[n / 2]
}

print(result)
