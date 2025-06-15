while let input = readLine() {
    let st = input.split(separator: " ").map { String($0) }
    let (s, t) = (st[0].map { $0 }, st[1].map { $0 })
    
    var i = 0
    var j = 0
    
    while i < s.count && j < t.count {
        if s[i] == t[j] {
            i += 1
        }
        j += 1
    }
    print(i == s.count ? "Yes" : "No")
}
