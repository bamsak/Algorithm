for _ in 0..<Int(readLine()!)! {
  let ln = readLine()!.split(separator: " ").map { Int($0)! }
  let (l, n) = (ln[0], ln[1])
  
  var result = 0
  
  var weight = 0
  var current = 0
  
  for _ in 0..<n {
    let xw = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, w) = (xw[0], xw[1])
    
    result += (x - current)
    
    if weight + w < l {
      weight += w
      current = x
    } else if weight + w == l {
      result += x
      weight = 0
      current = 0
    } else {
      result += (x * 2)
      weight = w
      current = x
    }
  
  }
  
  result += current
  
  print(result)
}