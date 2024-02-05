let n = Int(readLine()!)!
let center = n - 1
var left = center - 1

var star = [String](repeating: " ", count: n)

star[center] = "*"

for _ in 0..<n {
    print(star.joined())
    
    if left < 0 {
        break
    }
    star[left] = "*"
    star.append("*")
    
    left -= 1
}