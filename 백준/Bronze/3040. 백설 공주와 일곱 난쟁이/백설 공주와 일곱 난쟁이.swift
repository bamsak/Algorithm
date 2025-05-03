var nums = [Int]()
var sum = 0
for _ in 0..<9 {
    let num = Int(readLine()!)!
    nums.append(num)
    sum += num
}

var find = false
var temp = [Bool](repeating: false, count: 9)

for i in 0..<8 {
    if find { break }
    for j in i + 1..<9 where sum - nums[i] - nums[j] == 100 {
        temp[i] = true
        temp[j] = true
        find = true
        break
    }
}

for i in 0..<9 where !temp[i] {
    print(nums[i])
}
