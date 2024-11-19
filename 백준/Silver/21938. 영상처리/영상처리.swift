let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var board = Array(repeating: Array(repeating: 0, count: m), count: n)

for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var temp = 0
    for i in 0..<input.count {
        temp += input[i]
        if (i + 1) % 3 == 0 {
            board[y][i/3] = temp / 3
            temp = 0
        }
    }
}
let t = Int(readLine()!)!

for y in 0..<n {
    for x in 0..<m {
        if board[y][x] >= t {
            board[y][x] = 255
        } else {
            board[y][x] = 0
        }
    }
}
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var result = 0
for y in 0..<n {
    for x in 0..<m where board[y][x] == 255 {
        result += 1
        dfs(x, y)
    }
}

func dfs(_ x: Int, _ y: Int) {
    board[y][x] = 0
    
    for i in 0..<dx.count {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if board[newY][newX] != 255 { continue }
        dfs(newX, newY)
    }
}

print(result)
