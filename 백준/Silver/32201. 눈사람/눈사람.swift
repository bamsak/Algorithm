let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let temp = readLine()!.split(separator: " ").map { Int($0)! }

var dict = [Int: Int]()
var result = [Int: (diff: Int, curr: Int)]()

for i in 0..<n {
  dict[arr[i]] = i + 1
}

for i in 0..<n{
  result[temp[i]] = (dict[temp[i]]! - (i + 1), i + 1)
}

let m = result.max { $0.value.diff < $1.value.diff }!.value.diff
result.filter { $0.value.diff == m }.sorted { $0.value.curr < $1.value.curr}.forEach {
  print($0.key, terminator: " ")
}