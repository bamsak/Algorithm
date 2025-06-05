let hw = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (hw[0], hw[1])

var sky = [[Character]]()
var result = Array(repeating: Array(repeating: -1, count: w), count: h)


for _ in 0..<h {
  let input = readLine()!.map { $0 }
  sky.append(input)
}

for i in 0..<h {
  var temp = -1
  for j in 0..<w {
    if sky[i][j] == "c" {
      result[i][j] = 0
      temp = j
    } else if temp != -1 {
      result[i][j] = j - temp
    }
  }
}

result.forEach {
  print($0.map { String($0) }.joined(separator: " "))
}