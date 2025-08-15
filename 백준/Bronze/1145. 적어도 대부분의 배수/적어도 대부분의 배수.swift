let nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

outer: for num in 1...nums.reduce(1, *) {
    var temp = 0
    for i in 0..<nums.count where num % nums[i] == 0 {
        temp += 1
        if temp == 3 {
            result = num
            break outer
        }
    }
}
print(result)
