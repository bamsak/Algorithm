let n = Int(readLine()!)!
var lines = [Int]()

for _ in 0..<n {
    lines.append(Int(readLine()!)!)
}

lines.sort(by: >)

var check = false
var result = (0, 0, 0)

for i in 0..<n - 2 {
    if lines[i] < lines[i + 1] + lines[i + 2] {
        result = (lines[i], lines[i + 1], lines[i + 2])
        check = true
        break
    }
}

print(check ? result.0 + result.1 + result.2 : -1)
