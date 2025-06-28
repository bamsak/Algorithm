for _ in 0..<Int(readLine()!)! {
    var m = Int(readLine()!)!
    let q = m / 25
    m %= 25
    let d = m / 10
    m %= 10
    let n = m / 5
    m %= 5
    let p = m / 1
    m %= 1
    print("\(q) \(d) \(n) \(p)")
}
