let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var psum = [Int](repeating: 0, count: n)

for i in 1..<n {
  let temp = array[i] < array[i - 1] ? psum[i - 1] + 1 : psum[i - 1]
  psum[i] = temp
}

for _ in 0..<Int(readLine()!)! {
  let se = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  let (s, e) = (se[0], se[1])
  print(psum[e] - psum[s])
}