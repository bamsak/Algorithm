for _ in 0..<Int(readLine()!)! {
    var arr = [String]()
    
    for _ in 0..<Int(readLine()!)! {
        let input = readLine()!
        arr.append(input)
    }
    temp()
    
    func temp() {
        for i in 0..<arr.count {
            for j in 0..<arr.count {
                if i == j {
                    continue
                }
                
                let x = arr[i] + arr[j]
                
                if x == String(x.reversed()) {
                    print(x)
                    return
                }
            }
        }
        print(0)
    }
}
