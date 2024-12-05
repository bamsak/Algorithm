let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! == 1 ? true : false }
var temp = Array(repeating: false, count: n)
var result = 0

for i in 0..<n where arr[i] != temp[i] {
    result += 1
    if i + 2 < n {
        for  j in i...i + 2 {
            temp[j].toggle()
        }
    } else {
        for j in i..<n {
            temp[j].toggle()
        }
    }
}
print(result)