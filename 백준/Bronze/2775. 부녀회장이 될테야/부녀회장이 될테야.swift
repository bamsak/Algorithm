var arr = [[Int]](repeating: [Int](repeating: 1, count: 14), count: 15)
arr[0] = Array(1...14)

for i in 1..<arr.count {
    for j in 1..<arr[i].count {
        arr[i][j] = arr[i][j - 1] + arr[i - 1][j]
    }
}

for _ in 0..<Int(readLine()!)! {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(arr[k][n - 1])
}