let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var temp = Set<String>()

for _ in 0..<n {
    temp.insert(readLine()!)
}
var result = 0
for _ in 0..<m {
    if temp.contains(readLine()!) {
        result += 1
    }
}
print(result)