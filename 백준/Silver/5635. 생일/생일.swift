var arr = [(name: String, y: Int, m: Int, d: Int)]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    arr.append((String(input[0]), Int(input[3])!, Int(input[2])!, Int(input[1])!))
}

arr.sort {
    if $0.y == $1.y {
        if $0.m == $1.m {
            return $0.d < $1.d
        }
        return $0.m < $1.m
    }
    return $0.y < $1.y
}

print("\(arr.last!.name)\n\(arr.first!.name)")