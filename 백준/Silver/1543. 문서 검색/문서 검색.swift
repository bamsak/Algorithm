let input = readLine()!.map { String($0) }
let str = readLine()!
var idx = 0
var result = 0

while idx <= input.count - str.count {
  let temp = input[idx..<idx + str.count].joined()
  if temp == str {
    idx += str.count
    result += 1
    continue
  }
  
  idx += 1
}

print(result)