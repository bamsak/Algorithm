let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var visited = Array(repeating: false, count: n)
var result = 1

for i in 1...n {
    var f = false
    
    for j in 0..<n where !visited[j] {
        if i < array[j] { break }
        var temp = array[j]
        
        while temp < i  {
            temp += k
        }
        
        if temp == i {
            visited[j] = true
            f = true
            break
        }
    }
    
    if !f {
        result = 0
        break
    }
}

print(result)