let n = Int(readLine()!)!
let lengths = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var total = lengths.reduce(0, +)

var result = 0

for i in 0..<n {
  total -= lengths[i]
  
  if total == 0 {
    break
  }
  
  result += total * lengths[i]
}

print(result)