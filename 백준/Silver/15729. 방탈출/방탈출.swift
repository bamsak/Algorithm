let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var temp = Array(repeating: 0, count: n)
var index = 0

var result = 0

while index < n {
    if arr[index] == temp[index] {
        index += 1
        continue
    }
    result += 1
    
    if index + 2 < n {
        for i in index...index + 2 {
            temp[i] = temp[i] == 1 ? 0 : 1
        }
    } else {
        for i in index..<arr.count {
            temp[i] = temp[i] == 1 ? 0 : 1
        }
    }
    index += 1
}

print(result)
