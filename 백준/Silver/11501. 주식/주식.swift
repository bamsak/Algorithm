for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let stocks = readLine()!.split(separator: " ").map { Int($0)! }
    var maxStock = 0
    var result = 0
    
    for i in (0..<n).reversed() {
        maxStock = max(maxStock, stocks[i])
        
        if maxStock > stocks[i] {
            result += maxStock - stocks[i]
        }
    }
    
    print(result)
}
