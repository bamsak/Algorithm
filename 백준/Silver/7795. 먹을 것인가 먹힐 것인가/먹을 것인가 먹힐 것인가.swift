for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (readLine()!.split(separator: " ").map { Int($0)! }.sorted(), readLine()!.split(separator: " ").map { Int($0)! }.sorted())
    var result = 0
    
    for i in a {
        for j in b {
            if i > j {
                result += 1
            } else {
                break
            }
        }
    }
    print(result)
}
