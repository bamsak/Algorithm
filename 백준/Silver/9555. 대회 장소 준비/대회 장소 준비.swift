
let dx = [0, 1, 0, -1, -1, 1, 1, -1]
let dy = [1, 0, -1, 0, -1, 1, -1, 1]

for _ in 0..<Int(readLine()!)! {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, m) = (nm[0], nm[1])
  var map = [[Int]]()
  
  for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! == -1 ? Int($0)! : Int($0)! - 1 }
    map.append(input)
  }
  
  var check = [Bool](repeating: false, count: 100)
  
  for y in 0..<n {
    for x in 0..<m {
      let now = map[y][x]
      if now == -1 || check[now] { continue }
      for i in 0..<dx.count {
          let newX = x + dx[i]
          let newY = y + dy[i]
          if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
          if map[newY][newX] == now {
            check[now] = true
            break
          }
      }
    }
  }
  
  print(check.filter { $0 }.count)
}