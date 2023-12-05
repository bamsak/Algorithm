let n = Int(readLine()!)!
let m = Int(readLine()!)!

var cities = [Int](0..<n)
var result = "YES"

for i in 0..<n {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<n {
        if inputs[j] == 1 {
            union(i, j)
        }
    }
}

func find(_ index: Int) -> Int {
    if cities[index] == index {
        return index
    }
    cities[index] = find(cities[index])
    return cities[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    if aP != bP {
        cities[bP] = aP
    }
}
let plan = readLine()!.split(separator: " ").map { Int($0)! - 1}
var first = plan[0]

for city in plan {
    let cP = find(city)
    if cP != cities[first] {
        result = "NO"
    }
}
print(result)