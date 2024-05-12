let n = Int(readLine()!)!
var temp = n
var result = 0

while true {
    let sum = (temp / 10) + (temp % 10)
    temp = ((temp % 10) * 10) + sum % 10
    result += 1
    
    if temp == n {
        break
    }
}

print(result)