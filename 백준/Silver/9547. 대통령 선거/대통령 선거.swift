for _ in 0..<Int(readLine()!)! {
    let cv = readLine()!.split(separator: " ").map { Int($0)! }
    let (c, v) = (cv[0], cv[1])
    var nomis = [Int: Int]()
    var temp = [[Int]]()
    
    for i in 1...c {
        nomis[i] = 0
    }
    
    for _ in 0..<v {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        nomis[input[0]]! += 1
        temp.append(input)
    }
    
    let foo = nomis.filter { $0.value >= v / 2 + 1 }
    if foo.count == 1 {
        print("\(foo.keys.first!) \(1)")
        continue
    }
    
    let f = nomis.sorted { $0.value > $1.value }
    nomis = [f[0].key: 0, f[1].key: 0]
    
    for i in 0..<v {
        for j in 0..<c where nomis[temp[i][j]] != nil {
            nomis[temp[i][j]]! += 1
            break
        }
    }
    
    print("\(nomis.max {$0.value < $1.value}!.key) \(2)")
}