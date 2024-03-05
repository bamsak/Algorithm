let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var reports = [String: Int]()

var score = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    reports[input[0]] = Int(input[1])!
}

for _ in 0..<k {
    let sub = readLine()!
    score += reports[sub]!
    reports.removeValue(forKey: sub)
}

var min = score
var max = score

let sorted = reports.sorted { $0.value < $1.value }

for i in 0..<m-k {
    min += sorted[i].value
    max += sorted[sorted.count - 1 - i].value
}

print("\(min) \(max)")