let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let lions = arr.enumerated().filter { $0.element == 1 }.map { $0.offset }

if lions.count < k {
  print(-1)
} else {
  var result = arr.count
  var left = 0
  var right = k - 1
  
  while right < lions.count {
    let temp = lions[right] - lions[left] + 1
    result = min(result, temp)
    left += 1
    right += 1
  }
  
  print(result)
}