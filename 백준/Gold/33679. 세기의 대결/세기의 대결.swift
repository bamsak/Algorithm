let n = Int(readLine()!)!
let yjb = readLine()!.split(separator: " ").map { Int($0)! }
let hgb = readLine()!.split(separator: " ").map { Int($0)! }

var ym = 0
var hm = 0

for i in 0..<n {
  var ydp = [Int](repeating: 1, count: n)
  var hdp = [Int](repeating: 1, count: n)
  
  for j in 0..<n {
    let jdx = (i + j) % n
    for k in 0..<j {
      let kdx = (i + k) % n
      
      if yjb[kdx] < yjb[jdx] {
        ydp[j] = max(ydp[j], ydp[k] + 1)
      }
      
      if hgb[kdx] < hgb[jdx] {
        hdp[j] = max(hdp[j], hdp[k] + 1)
      }
    }
  }
  
  hm = max(hm, hdp.max()!)
  ym = max(ym, ydp.max()!)
}

if hm == ym {
  print("Both Win!")
} else if hm > ym {
  print("HG Win!")
} else {
  print("YJ Win!")
}