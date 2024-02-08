let n = Int(readLine()!)!
var result = ""
var p = n - 1

for i in 0..<n {
    let starCount = 1 + (i * 2)
    let star = "\(String(repeating: " ", count: p) + String(repeating: "*", count: starCount))\n"
    if p > 0 {
        p -= 1
    }
    result += star
}

for j in (0..<n - 1).reversed() {
    let starCount = 1 + (j * 2)
    let star = "\(String(repeating: " ", count: p + 1) + String(repeating: "*", count: starCount))\n"
    p += 1
    result += star
}
print(result)
