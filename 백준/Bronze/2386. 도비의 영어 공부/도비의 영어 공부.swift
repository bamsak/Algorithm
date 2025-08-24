while let input = readLine() {
    if input == "#" { break }
    let temp = input.split(separator: " ").map { String($0) }
    var result = 0
    for t in temp[1...] {
        for j in t.map { String($0).lowercased() } {
            if j == temp[0] { result += 1}
        }
    }
    
    print("\(temp[0]) \(result)")
}
