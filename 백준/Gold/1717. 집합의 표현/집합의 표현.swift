let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var result = [String]()

var arr = [Int](0...n)

for _ in 0..<m {
    let set = readLine()!.split(separator: " ").map { Int($0)! }
    let input = set[0]
    let (a, b) = (set[1], set[2])
    
    if input == 0 {
        union(a, b)
    } else {
        let aP = find(a)
        let bP = find(b)
        
        if aP == bP {
            result.append("YES")
        } else {
            result.append("NO")
        }
    }
}

func find(_ index: Int) -> Int {
    if arr[index] == index {
        return index
    }
    arr[index] = find(arr[index])
    return arr[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        arr[bP] = aP
    }
}

print("\(result.joined(separator: "\n"))")