var map = Array(repeating: Array(repeating: 0, count: 0), count: 5)

for i in 0..<5 {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
let yx = readLine()!.split(separator: " ").map { Int($0)! }
let (y, x) = (yx[0], yx[1])

var result = Int.max

func dfs(_ x: Int, _ y: Int, _ count: Int, _ depth: Int) {
    map[y][x] = -1
    
    if count == 3 {
        result = min(result, depth)
        return
    }
    
    for i in 0..<dx.count {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= 5 || newY >= 5 { continue }
        if map[newY][newX] == -1 { continue }
        let temp = map[newY][newX]
        let newCount = temp == 1 ? count + 1 : count
        dfs(newX, newY, newCount, depth + 1)
        map[newY][newX] = temp
    }
}

dfs(x, y, map[y][x] == 1 ? 1 : 0, 0)
print(result == Int.max ? -1 : result)
