let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var customers = [(num: Int, sushi: Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int($0)!}[1...]
    
    for a in input {
        customers.append((i, a))
    }
}

customers = customers.sorted {
    if $0.sushi == $1.sushi {
        return $0.num < $1.num
    }
    return $0.sushi < $1.sushi
}.reversed()

let sushi = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = [Int](repeating: 0, count: n)

for s in sushi {
    while let last = customers.last, last.sushi < s {
        customers.removeLast()
    }
    
    if let current = customers.last, current.sushi == s {
        result[current.num] += 1
        customers.removeLast()
    }
}

print(result.map{ String($0)}.joined(separator: " "))