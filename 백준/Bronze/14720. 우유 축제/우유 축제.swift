let n = Int(readLine()!)!
let milks = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
for milk in milks {
    if milk == result % 3 {
        result += 1
    }
}
print(result)