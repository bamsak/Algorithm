let n = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map { Int($0)! }

let total = heights.reduce(0, +)

if total % 3 != 0 {
  print("NO")
} else {
  let temp = total / 3
  
  var maximum = 0
  
  for h in heights {
    maximum += h / 2
  }
  
  if maximum < temp {
    print("NO")
  } else {
    print("YES")
  }
}