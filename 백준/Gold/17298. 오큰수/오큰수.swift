let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: -1, count: n)
var stack = [Int]()

for i in 0..<arr.count {
    while !stack.isEmpty && arr[stack.last!] < arr[i] {
        result[stack.removeLast()] = arr[i]
    }
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))
