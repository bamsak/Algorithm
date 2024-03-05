let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var campus = Array(repeating: Array(repeating: "", count: 0), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    let input = readLine()!.map { String($0) }
    campus[i] = input
}

var stack = [(x: Int, y: Int)]()

for y in 0..<n {
    for x in 0..<m {
        if campus[y][x] == "I" {
            stack.append((x, y))
            visited[y][x] = true
            break
        }
    }
}

let mx = [0, 1, 0, -1]
let my = [1, 0, -1, 0]

var count = 0

while stack.isEmpty == false {
    let coord = stack.removeLast()
    
    for i in 0..<mx.count {
        let newX = coord.x + mx[i]
        let newY = coord.y + my[i]
        
        if newX < 0 || newX >= m || newY < 0 || newY >= n {
            continue
        }
        
        if visited[newY][newX] { continue }
        
        if campus[newY][newX] == "X" {
            visited[newY][newX] = true
            continue
        }
        
        if campus[newY][newX] == "P" {
            count += 1
        }
        
        visited[newY][newX] = true
        stack.append((newX, newY))
    }
}
print(count == 0 ? "TT": count)