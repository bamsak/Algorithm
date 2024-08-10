let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])
var map = Array(repeating: Array(repeating: "", count: 0), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)

for i in 0..<r {
    map[i] = readLine()!.map { String($0) }
}

var stack = [(x: Int, y: Int)]()
var sheep = 0
var wolf = 0

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for y in 0..<r {
    for x in 0..<c where !visited[y][x] && map[y][x] != "#" {
        var v = 0
        var k = 0
        stack.append((x, y))
        visited[y][x] = true
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            if map[current.y][current.x] == "v" {
                v += 1
            }
            if map[current.y][current.x] == "k" {
                k += 1
            }
            
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                
                if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
                if visited[newY][newX] || map[newY][newX] == "#" { continue }
                stack.append((newX, newY))
                visited[newY][newX] = true
            }
        }
        
        if k > v {
            sheep += k
        } else {
            wolf += v
        }
    }
}

print("\(sheep) \(wolf)")