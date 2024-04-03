let s = Int(readLine()!)!
var sum = 0
var num = 1
while true {
    if s == sum {
        num -= 1
        break
    }
    if sum > s {
        num -= 2
        break
    }
    sum += num
    num += 1
}
print(num)
