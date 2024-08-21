var map = Array(repeating: Array(repeating: "", count: 0), count: 5)

for y in 0..<5 {
    map[y] = readLine()!.split(separator: " ").map { String($0) }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var result = Set<String>()

func dfs(x: Int, y: Int,_ str: String) {
    if str.count == 6 {
        result.insert(str)
        return
    }
    
    for i in 0..<dx.count {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= 5 || newY >= 5 { continue }
        dfs(x: newX, y: newY, str + map[newY][newX])
    }
}

for y in 0..<5 {
    for x in 0..<5 {
        dfs(x: x, y: y, map[y][x])
    }
}

print(result.count)
