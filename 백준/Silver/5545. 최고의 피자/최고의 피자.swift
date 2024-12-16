let n = Int(readLine()!)!
let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (ab[0], ab[1], Int(readLine()!)!)
var array = [Int]()
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

array.sort(by: >)

var result = c / a
var topping = 0

for i in 0..<n {
    let count = i + 1
    let price = a + b * count
    
    topping += array[i]
    
    let k = topping + c
    let temp = k / price
    
    if temp < result {
        break
    }
    result = temp
}

print(result)
