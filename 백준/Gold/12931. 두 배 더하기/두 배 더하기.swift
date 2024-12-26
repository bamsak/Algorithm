let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
let temp = Array(repeating: 0, count: n)

var result = 0

while array != temp {
    var trigger = true
    
    for i in 0..<n {
        if array[i] % 2 != 0 {
            trigger = false
            array[i] -= 1
            result += 1
        }
    }
    
    if trigger {
        array = array.map { $0 / 2 }
        result += 1
    }
}
print(result)
