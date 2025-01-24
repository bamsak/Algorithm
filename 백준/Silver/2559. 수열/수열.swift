let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var psum = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    psum[i] = psum[i - 1] + nums[i - 1]
}

var result = Int.min

for i in k...n {
    result = max(result, psum[i] - psum[i - k])
}
print(result)