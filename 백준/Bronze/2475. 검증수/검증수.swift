let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var nums = [Int]()
for i in 0..<numbers.count {
    let n = numbers[i] * numbers[i]
    nums.append(n)
}
print(nums.reduce(0, +) % 10)
