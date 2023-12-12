let n = Int(readLine()!)!

var arr = [Int](repeating: 0, count: n)

let a = readLine()!.split(separator: " ").map{ Int($0)! }

var minValue = a[0]
for i in 1..<a.count {
    minValue = min(minValue, a[i])
    
    if a[i] - minValue >= arr[i - 1] {
        arr[i] = a[i] - minValue
    } else {
        arr[i] = arr[i - 1]
    }
}

print("\(arr.map {String($0)}.joined(separator: " "))")