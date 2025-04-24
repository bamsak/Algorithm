let nsp = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s, p) = (nsp[0], nsp[1], nsp[2])

if n == 0 {
  print(1)
} else {
  let scores = readLine()!.split(separator: " ").map { Int($0)! }
  var result = -1
    
  if n == p && scores.last! >= s {
    print(result)
  } else {
    result = 1
    
    for score in scores {
      if score > s {
        result += 1
      } else if score < s {
        break
      }
    }
    
    print(result)
  }
}