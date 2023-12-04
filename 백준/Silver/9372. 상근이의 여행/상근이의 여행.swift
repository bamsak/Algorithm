var result = ""

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    
    var countries = [Int](0..<n)
    var count = 0
    
    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        let (a, b) = (ab[0], ab[1])
        
        let aP = find(a)
        let bP = find(b)
        
        if aP != bP {
            count += 1
            countries[bP] = aP
        }
    }
    
    print("\(count)")
    
    func find(_ index: Int) -> Int{
        if countries[index] == index {
            return index
        }
        return find(countries[index])
    }  
}