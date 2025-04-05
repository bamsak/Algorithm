let n = Int(readLine()!)!
var nums = Set(1...9)

if n > 1 {
    for _ in 2...n {
        var temp = Set<Int>()
        for num in nums {
            for i in 1...9 {
                temp.insert(num * i)
            }
        }
        nums = temp
    }
}
print(nums.count)