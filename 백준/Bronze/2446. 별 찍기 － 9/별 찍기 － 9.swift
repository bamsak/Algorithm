let n = Int(readLine()!)!
var star = Array(repeating: "*", count: n * 2 - 1)
var idx = 2

print(star.joined())
for i in 0..<star.count - 1 {
    if i < n - 1 {
        star[i] = " "
        star.removeLast()
    } else {
        star[star.count - idx] = "*"
        star.append("*")
        idx += 2
    }
    print(star.joined())
}