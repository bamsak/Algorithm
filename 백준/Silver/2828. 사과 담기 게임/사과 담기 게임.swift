let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let j = Int(readLine()!)!

var basket = (left: 1, right: m)
var result = 0

for _ in 0..<j {
    let apple = Int(readLine()!)!
    
    if apple < basket.left {
        result += basket.left - apple
        basket.right -= basket.left - apple
        basket.left = apple
        continue
    }
    
    if apple > basket.right {
        result += apple - basket.right
        basket.left += apple - basket.right
        basket.right = apple
    }
}

print(result)