var arr = [[Int]]()
var c = 0

for _ in 0..<Int(readLine()!)! {
  var input = readLine()!.split(separator: " ").map { Int($0)! }
  input.removeLast()
  arr.append(input)
  c = max(c, input.count)
}

for i in 0..<arr.count where arr[i].count < c {
  arr[i] += [Int](repeating: 0, count: c - arr[i].count)
}

var result = 0
var temp = Set<[Int]>()

while result <= c {
  for a in arr {
    temp.insert(Array(a.prefix(result)))
  }
  
  if temp.count == arr.count {
    break
  }
  result += 1
  temp.removeAll()
  
}

print(result)

