var result = 4

for num in (4...Int(readLine()!)!).reversed() {
    let str = String(num).map { $0 }
    
    var temp = true
    
    for s in str {
        if s == "4" || s == "7" {
            continue
        }
        temp = false
        break
    }
    
    if temp {
        result = num
        break
    }
}

print(result)
