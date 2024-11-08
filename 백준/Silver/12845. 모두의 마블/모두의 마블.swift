let n = Int(readLine()!)!
let levels = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

let temp = levels.first!
var result = 0
if n == 1 {
    print(temp)
} else {
    for i in 1..<n {
        result += temp + levels[i]
    }
    print(result)
}