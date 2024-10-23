for _ in 0..<Int(readLine()!)! {
    let count = Int(readLine()!)!
    var trees = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    var temp = Array(repeating: 0, count: count)
    let mid = count / 2
    var idx = 1
    temp[mid] = trees.removeLast()
    
    while !trees.isEmpty  {
        temp[mid - idx] = trees.removeLast()
        if trees.isEmpty { break }
        temp[mid + idx] = trees.removeLast()
        idx += 1
    }
    
    var result = abs(temp.last! - temp.first!)
    
    for i in 0..<count - 1 {
        result = max(result, abs(temp[i] - temp[i + 1]))
    }
    print(result)
}