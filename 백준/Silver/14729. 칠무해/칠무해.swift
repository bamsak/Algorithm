import Foundation

var arr = [Double]()

for _ in 0..<Int(readLine()!)! {
    let s = Double(readLine()!)!
    arr.append(s)
}

arr.sort()

print(arr[...6].map { String(format: "%.3f", $0) }.joined(separator: "\n"))