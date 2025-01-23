let nx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (nx[0], nx[1])
let array = readLine()!.split(separator: " ").map { Int($0)! }
var psum = Array(repeating: 0, count: n + 1)

for i in 1...n {
    psum[i] = array[i - 1] + psum[i - 1]
}

var result = 0
var count = 0

for i in 1...n {
    if i < x {
        result = max(result, psum[i])
        continue
    }
    
    let newValue = psum[i] - psum[i - x]
    
    if result < newValue {
        result = newValue
        count = 1
    } else if result == newValue {
        count += 1
    }
}

if result == 0 {
    print("SAD")
} else {
    print("\(result)\n\(count)")
}
