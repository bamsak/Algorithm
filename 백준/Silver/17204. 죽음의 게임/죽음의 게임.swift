let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var nums = [Int]()

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

var current = 0
var count = 0

for _ in 0..<n {
    current = nums[current]
    count += 1
    if current == k { break }
}

count == n ? print(-1) : print(count)
