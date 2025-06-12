while let input = readLine() {
    let nm = input.split(separator: " ")
    let (n, m) = (Int(nm[0])!, Int(nm[1])!)
    var result = 0
    for num in n...m {
        let temp = String(num).map { $0 }
        let foo = Set(temp)
        
        if temp.count == foo.count {
            result += 1
        }
        
    }
    print(result)
}
