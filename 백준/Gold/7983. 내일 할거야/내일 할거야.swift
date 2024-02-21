let n = Int(readLine()!)!
var arr = [(d: Int, t: Int)]()

for _ in 0..<n {
    let dt = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((dt[0], dt[1]))
}

let sorted = arr.sorted(by: { $0.t > $1.t })
var day = sorted.first!.t

sorted.forEach {
    if day >= $0.t {
        day = $0.t - $0.d
    } else {
        day -= $0.d
    }
}

print(day)