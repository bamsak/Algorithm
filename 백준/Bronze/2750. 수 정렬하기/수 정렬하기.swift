var arr = [Int]()

for _ in 0..<Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}

arr.sort()
arr.forEach { print($0) }