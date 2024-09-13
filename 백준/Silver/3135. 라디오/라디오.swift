let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (ab[0], ab[1])
var arr = [Int]()

for _ in 0..<Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}

var result = abs(a - b)

for ch in arr {
    result = min(result, abs(ch - b) + 1)
}

print(result)