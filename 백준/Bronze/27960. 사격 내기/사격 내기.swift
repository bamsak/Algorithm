let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (ab[0], ab[1])
var c = 0

for i in 0..<10 {
    let ba = a >> i & 1
    let bb = b >> i & 1
    
    if ba != bb {
        c += 1 << i
    }
}

print(c)
