let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let books = readLine()!.split(separator: " ").map { Int($0)! }
var left = books.filter{ $0 < 0 }.sorted(by: >)
var right = books.filter { $0 > 0 }.sorted()

var result = 0

if abs(left.last ?? 0) < right.last ?? 0 {
    result += right.last ?? 0
    for _ in 0..<m {
        _ = right.popLast()
    }
} else  {
    result += abs(left.last ?? 0)
    for _ in 0..<m {
        _ = left.popLast()
    }
}

while !left.isEmpty {
    result += abs(left.last!) * 2
    
    for _ in 0..<m {
        _ = left.popLast()
    }
}

while !right.isEmpty {
    result += right.last! * 2
    
    for _ in 0..<m {
        _ = right.popLast()
    }
}

print(result)