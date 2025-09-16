var c = 1

while let input = readLine() {
    let lpv = input.split(separator: " ").map { Int($0)! }
    if lpv[0] == 0 { break }
    let (l, p, v) = (lpv[0], lpv[1], lpv[2])
    var result = v / p * l
    
    if v % p >= l {
        result += l
    } else {
        result += v % p
    }
    
    print("Case \(c): \(result)")
    c += 1
}
