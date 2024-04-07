for i in 0..<Int(readLine()!)! {
    let scores = readLine()!.split(separator: " ").map { Int($0)! }[1...].sorted()
    
    var sub = 0
    var previous = 0
    
    for j in 0..<scores.count {
        if j != 0 {
            sub = max(sub, scores[j] - previous)
        }
        previous = scores[j]
    }
    
    print("Class \(i + 1)\nMax \(scores.last!), Min \(scores.first!), Largest gap \(sub)")
}
