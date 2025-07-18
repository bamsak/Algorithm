let rc = readLine()!.split(separator: " ").map  { Int($0)! }
let (r, c) = (rc[0], rc[1])
var map = [[Character]]()
var temp: [[Character]] = Array(repeating: Array(repeating: ".", count: c), count: r)

for i in 0..<r {
  let input = readLine()!.map { $0 }
  map.append(input)
}


let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for y in 0..<r {
  for x in 0..<c {
    if map[y][x] != "X" { continue }
    
    var count = 0
    for i in 0..<4 {
      let newX = x + dx[i]
      let newY = y + dy[i]
      
      if newX < 0 || newY < 0 || newX >= c || newY >= r {
        count += 1
        continue
      }
      
      if map[newY][newX] == "." {
        count += 1
      }
    }
    
    if count < 3 {
      temp[y][x] = "X"
    }
  }
}

var left = c
var right = -1
var top = r
var bottom = -1

for y in 0..<r {
  for x in 0..<c where temp[y][x] == "X" {
    left = min(left, x)
    right = max(right, x)
    top = min(top, y)
    bottom = max(bottom, y)
  }
}

for y in top...bottom {
  var result = ""
  for x in left...right {
    result += String(temp[y][x])
  }
  
  print(result)
}