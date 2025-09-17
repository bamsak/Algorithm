let nk = readLine()!.split(separator: " ").map { Int($0)! }
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var result = true
for i in 0..<n {
  if nums[i] % k != i % k {
    result = false
    break
  }
}
print(result ? "Yes" : "No")