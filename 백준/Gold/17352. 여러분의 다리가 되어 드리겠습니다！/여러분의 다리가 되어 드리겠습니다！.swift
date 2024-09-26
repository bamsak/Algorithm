let n = Int(readLine()!)!
var array = [Int](0...n)

func find(parentOf child: Int) -> Int {
    if child != array[child] {
        array[child] = find(parentOf: array[child])
    }
    return array[child]
}

func union(_ a: Int, _ b: Int) {
    let ap = find(parentOf: a)
    let bp = find(parentOf: b)
    array[max(ap, bp)] = min(ap, bp)
}


for _ in 0..<n - 2 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    
    union(a, b)
}

for i in 2...n {
    if find(parentOf: 1) != find(parentOf: i) {
        print(1, i)
        break
    }
}