let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var classRoom = [Int](0..<n)
var result = 0
for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (i,j) = (ij[0], ij[1])

    let iP = find(i)
    let jP = find(j)

    if iP != jP {
        classRoom[jP] = iP
    }
}

func find(_ index: Int) -> Int {
    if classRoom[index] == index {
        return index
    }
    classRoom[index] = find(classRoom[index])
    return classRoom[index]
}

let plan = readLine()!.split(separator: " ").map{ Int($0)! - 1 }
var first = plan[0]

for p in plan {
    let pP = find(p)
    if pP != classRoom[first] {
        first = pP
        result += 1
    }
}
print(result)