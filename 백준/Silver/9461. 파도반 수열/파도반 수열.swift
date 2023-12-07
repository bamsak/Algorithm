let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr = [1, 1, 1]
    
    if n > 2 {
        for i in 3..<n{
            let a = arr[i - 2] + arr[i - 3]
            arr.append(a)
        }
    }
    print(arr.last!)
}
