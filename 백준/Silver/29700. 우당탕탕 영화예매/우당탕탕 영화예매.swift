let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var result = 0

for _ in 0..<n {
    let input =  readLine()!.map { Int(String($0))! }
    var current = 0
    
    for x in 0..<m {
        if input[x] == 0 {
            current += 1
        } else {
            current = 0
            continue
        }
        
        if current >= k {
            result += 1
        }
    }
}

print(result)