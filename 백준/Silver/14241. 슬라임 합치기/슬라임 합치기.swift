let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = 0

for i in 0..<n - 1 {
    result += array[i] * array[i + 1]
    array[i + 1] = array[i] + array[i + 1]
}
print(result)
