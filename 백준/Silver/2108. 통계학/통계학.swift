import Foundation

let n = Int(readLine()!)!
var arr = [Int]()
var dict = [Int: Int]()
for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
    if dict[num] == nil {
        dict[num] = 1
    } else {
        dict[num]! += 1
    }
}
let sortedArr = arr.sorted()
print(Int(round(Double(arr.reduce(0, +)) / Double(n))))
print(n == 1 ? sortedArr[0] : sortedArr[sortedArr.count / 2])
let max = dict.max(by: { $0.value < $1.value })!.value
let dictArr = dict.filter { $0.value == max }.sorted { $0.key < $1.key }

print(dictArr.count > 1 ? dictArr[1].key : dictArr[0].key)
print(sortedArr.last! - sortedArr.first!)
