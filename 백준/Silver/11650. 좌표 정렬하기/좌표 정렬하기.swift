let n = Int(readLine()!)!
var arr = [(x: Int, y: Int)]()
for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((xy[0], xy[1]))
}
let result = arr.sorted {
    return $0.x == $1.x ? $0.y < $1.y : $0.x < $1.x
}
result.forEach { print("\($0.x) \($0.y)")}