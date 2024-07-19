let n = Int(readLine()!)!
let k = Int(readLine()!)!
let seonsors = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var distance = [Int]()

if k >= n {
    print(0)
} else {
    for i in 1..<n {
        let diff = seonsors[i] - seonsors[i - 1]
        distance.append(diff)
    }
    
    distance.sort()
    
    for _ in 0..<k - 1 {
        distance.removeLast()
    }
    
    print(distance.reduce(0, +))
}
