let n = Int(readLine()!)!
var arr = [(a: Int, t: Int)]()
var time = 0

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((xy[0], xy[1]))
}

arr.sorted { $0.a < $1.a }.forEach {
    if time <= $0.a {
        time = $0.a + $0.t
    } else {
        time += $0.t
    }
}

print(time)