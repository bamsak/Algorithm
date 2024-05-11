let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])

var coord = Array(repeating: Array(repeating: 0, count: 0), count: m)

for i in 0..<m {
    coord[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var stack = [(x: Int, y: Int)]()
var result = 0

let dx = [0, 1, 0, -1, -1, 1, -1, 1]
let dy = [1, 0, -1, 0, -1, 1, 1, -1]

for y in 0..<m {
    for x in 0..<n where coord[y][x] == 1 {
        result += 1
        stack.append((x, y))
        coord[y][x] = 0
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                if newX < 0 || newY < 0 || newX >= n || newY >= m { continue }
                if coord[newY][newX] == 0 { continue }
                stack.append((newX, newY))
                coord[newY][newX] = 0
            }
        }
    }
}

print(result)