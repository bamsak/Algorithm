let n = Int(readLine()!)!
var star = Array(repeating: " ", count: n * 2)
var result = ""
for i in 0..<star.count {
    if i < n {
        star[i] = "*"
        star[star.count - 1 - i] = "*"
    } else {
        star[i] = " "
        star[star.count - 1 - i] = " "
    }
    result += "\(star.joined())\n"
}

print(result)