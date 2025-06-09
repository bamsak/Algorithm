let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var chocolates = readLine()!.split(separator: " ").map { Int($0)! }

var count = 0
var day = 0

for i in 1..<n {
  if chocolates[i] > chocolates[0] {
    day += 1
    count += chocolates[i] - chocolates[0]
  }
}
print("\(count) \(day)")