let n = Int(readLine()!)!
var star = [String](repeating: "*", count: n)

for i in 0..<n {
    print(star.joined())
    star[i] = " "
}