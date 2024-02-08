var maxN = 0
var maxI = 0

for i in 0..<9 {
    let n = Int(readLine()!)!
    if maxN < n {
        maxN = n
        maxI = i + 1
    }
}

print("\(maxN)\n\(maxI)")