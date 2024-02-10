func foo() {
    let hm = readLine()!.split(separator: " ").map { Int($0)! }
    var (h, m) = (hm[0], hm[1])
    if m - 45 < 0 {
        m = (m + 60) - 45
        
        if h == 0 {
            h = 23
        } else {
            h -= 1
        }
    } else {
        m -= 45
    }
    print("\(h) \(m)")
}

foo()