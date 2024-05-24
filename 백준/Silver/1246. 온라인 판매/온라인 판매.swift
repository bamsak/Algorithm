let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var eggs = [Int]()
var result = 0
var egg = 0

for _ in 0..<m {
    eggs.append(Int(readLine()!)!)
}

eggs.sort()

for i in 0..<eggs.count {
    var cost = 0
    if eggs[i...].count > n {
        cost = eggs[i] * n
    } else {
        cost = eggs[i] * eggs[i...].count
    }
    if cost > result {
        result = cost
        egg = eggs[i]
    }
}

print("\(egg) \(result)")
