let str = readLine()!
let n = Int(readLine()!)!

var result = 0

for _ in 0..<n {
    let ring = readLine()!.map { String($0) }
    var trigger = false
    
    for i in 0..<ring.count {
        var temp = ""
        
        for j in i..<i + str.count {
            let target = j >= ring.count ? j - ring.count : j
            temp += ring[target]
        }
        
        if temp == str {
            trigger = true
            break
        }
    }
    
    if trigger {
        result += 1
    }
}
print(result)
