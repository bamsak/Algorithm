let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, c) = (nk[0], nk[1])

var enenmies = [(s: Int, d: Int, i: Int)]()

for _ in 0..<n {
  let sdi = readLine()!.split(separator: " ").map { Int($0)! }
  let (s, d, i) = (sdi[0], sdi[1], sdi[2])
  enenmies.append((s, d, i))
}
var result = Int.max

for i in 0..<n {
  for j in 0..<n {
    for k in 0..<n {
      var count = 0
      
      for t in 0..<n {
        if enenmies[t].s > enenmies[i].s || enenmies[t].d > enenmies[j].d || enenmies[t].i > enenmies[k].i {
          continue
        }
        
        count += 1
        
        if count >= c {
          result = min(result, enenmies[i].s + enenmies[j].d + enenmies[k].i)
          break
        }
      }
    }
  }
}

print(result)