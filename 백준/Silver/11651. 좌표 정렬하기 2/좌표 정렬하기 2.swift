var arr = [(x: Int, y: Int)]()

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((xy[0], xy[1]))
}

let result = arr.sorted {
    if $0.y == $1.y {
        return $0.x < $1.x
    }
    return $0.y < $1.y
}

result.forEach { print("\($0.x) \($0.y)") }
