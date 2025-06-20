let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = n % 2 == 0 ? -1 : arr.removeLast()

for i in 0..<n/2 {
  result = max(result, arr[i] + arr[arr.count - 1 - i])
}

print(result)

