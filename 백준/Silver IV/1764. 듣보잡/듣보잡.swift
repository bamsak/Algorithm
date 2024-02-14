let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var dict = [String: String]()
var arr = [String]()

for _ in 0..<n {
    let a = readLine()!
    dict[a] = a
}

for _ in 0..<m {
    let b = readLine()!
    if let name = dict[b] {
        arr.append(name)
    }
}
print(arr.count)
arr.sorted().forEach { print($0) }