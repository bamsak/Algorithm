let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var parent = [Int](0..<n)

func find(parentOf child: Int) -> Int {
    if child != parent[child] {
        parent[child] = find(parentOf: parent[child])
    }
    return parent[child]
}

func union(_ a: Int, _ b: Int) {
    let ap = find(parentOf: a)
    let bp = find(parentOf: b)
    
    if ap != bp {
        parent[bp] = ap
    }
}

var result = 0
for i in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    if find(parentOf: a) == find(parentOf: b) {
        result = i + 1
        break
    }
    
    union(a, b)
}
print(result)
