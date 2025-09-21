for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    
    var (s, v) = (0, 0)
    
    for i in (1...a).reversed() {
        if a % i == 0 && b % i == 0 {
            s = i
            break
        }
    }
    
    for i in b... {
        if i % a == 0 && i % b == 0 {
            v = i
            break
        }
    }
    print("\(v) \(s)")
}
