let nm = readLine()!.split(separator: " ")
var arr = [Int]()

for _ in 0..<2 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr += input
}

print(arr.sorted().map { String($0) }.joined(separator: " "))
