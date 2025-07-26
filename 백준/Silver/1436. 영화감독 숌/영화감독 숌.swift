let n = Int(readLine()!)!
var temp = 0
var num = 666

while true {
    var count = 0
    
    for s in "\(num)" {
        if s == "6" {
            count += 1
        } else {
            count = 0
        }
        
        if count == 3 {
            temp += 1
        }
    }
    
    if temp == n { break }
    num += 1
}

print(num)
