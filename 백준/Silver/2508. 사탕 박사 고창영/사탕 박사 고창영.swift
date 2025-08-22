let t = Int(readLine()!)!

for _ in 0..<t {
  _ = readLine()
  let rc = readLine()!.split(separator: " ").map { Int($0)! }
  let (r, c) = (rc[0], rc[1])
  var map = [[Character]]()
  for _ in 0..<r {
    let input = readLine()!.map{ $0 }
    map.append(input)
  }
  
  var result = 0
    
  for y in 0..<r {
    for x in 0..<c {
      if map[y][x] == "v" && y < r - 2 {
        if map[y + 1][x] == "o" && map[y + 2][x] == "^" {
          result += 1
        }
      }
      
      if map[y][x] == ">" && x < c - 2 {
        if map[y][x + 1] == "o" && map[y][x + 2] == "<" {
          result += 1
        }
      }
    }
  }
  
  print(result)
}

