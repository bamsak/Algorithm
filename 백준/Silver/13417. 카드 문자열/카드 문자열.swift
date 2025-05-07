for _ in 0..<Int(readLine()!)! {
    _ = readLine()
    
    let input = readLine()!.split(separator: " ").map { String($0) }
    var temp = [String]()
    
    for i in input {
        guard let first = temp.first, first >= i
        else {
            temp.append(i)
            continue
        }
        temp.insert(i, at: 0)
    }
    
    print(temp.joined())
}
