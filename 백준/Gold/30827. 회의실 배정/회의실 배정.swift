let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var array = [(s: Int, e: Int)]()

for _ in 0..<n {
    let se = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((se[0], se[1]))
}
array.sort { $0.e < $1.e }

var endTimes = [Int](repeating: 0, count: k)
var result = 0

for m in array {
    endTimes.sort(by: >)
    
    for i in 0..<k where endTimes[i] < m.s {
        endTimes[i] = m.e
        result += 1
        break
    }
}

print(result)