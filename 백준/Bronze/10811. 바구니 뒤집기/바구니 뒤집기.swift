let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = Array(1...n)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b) = (ab[0], ab[1])
    
    for i in 0..<abs(a-b) / 2 + 1 {
        arr.swapAt(a + i, b - i)
    }
}

arr.forEach { print($0, terminator: " ") }
