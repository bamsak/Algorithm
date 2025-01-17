let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n, q) = (nq[0], nq[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var psum = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
    psum[i + 1] = nums[i] + psum[i]
}

var result = ""
for _ in 0..<q {
    let lr = readLine()!.split(separator: " ").map { Int($0)! }, 
    (l, r) = (lr[0], lr[1])
    
    result += "\(psum[r] - psum[l - 1])\n"
}

print(result)
