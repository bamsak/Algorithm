let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let cats = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var left = 0
var right = n - 1
var result = 0

while left < right {
    let temp = cats[left] + cats[right]
    if temp <= k {
        result += 1
    }
    
    if temp > k {
        right -= 1
    } else {
        left += 1
        right -= 1
    }
}

print(result)