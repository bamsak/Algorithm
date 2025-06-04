import Foundation

let n = Int(readLine()!)!
var arr = [Double]()

for _ in 0..<n {
  let num = Double(Int(readLine()!)!)
  arr.append(num)
}

arr.sort()

let t = Int((Double(n) * 0.15).rounded())
let c = n - (t + t)

if n == 0 {
  print(0)
} else {
  print(Int((arr[t..<n-t].reduce(0.0, +) / Double(c)).rounded()))
}
