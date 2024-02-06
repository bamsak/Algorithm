let n = Int(readLine()!)!
var star = [String](repeating: "*", count: 2 * n - 1)

for i in 0..<n {
    print(star.joined())
    star[i] = " "
    star.removeLast()
}