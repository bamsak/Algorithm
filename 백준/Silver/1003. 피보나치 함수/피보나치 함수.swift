let t = Int(readLine()!)!
var arr = [(Int, Int)](repeating: (0, 0), count: 41)
arr[0] = (1, 0)
arr[1] = (0, 1)
for i in 2..<arr.count {
    arr[i].0 = arr[i - 2].0 + arr[i - 1].0
    arr[i].1 = arr[i - 2].1 + arr[i - 1].1
}

for _ in 0..<t {
    let num = Int(readLine()!)!
    print("\(arr[num].0) \(arr[num].1)")
}
