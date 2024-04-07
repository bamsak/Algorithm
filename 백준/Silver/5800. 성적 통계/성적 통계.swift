for i in 0..<Int(readLine()!)! {
    let scores = readLine()!.split(separator: " ").map { Int($0)! }[1...].sorted()
    
    var sub = 0
    var previous = scores[0]
    
    for j in 1..<scores.count {
        sub = max(sub, scores[j] - previous)
        previous = scores[j]
    }
    
    print("Class \(i + 1)\nMax \(scores.last!), Min \(scores.first!), Largest gap \(sub)")
}