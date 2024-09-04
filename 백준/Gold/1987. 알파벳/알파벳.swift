let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])
var board = [[Int]](repeating: [], count: r)

for i in 0..<r {
    board[i] = readLine()!.map { Int($0.asciiValue! - 65) }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var result = -1

func dfs(_ x: Int, _ y: Int, _ count: Int, _ visited: Int) {
    result = max(result, count)

    for i in 0..<dx.count {
        let newX = x + dx[i]
        let newY = y + dy[i]

        if newX >= c || newY >= r || newX < 0 || newY < 0 { continue }

        let idx = board[newY][newX]
        let bit = 1 << idx
        if visited & bit == 0 {
            dfs(newX, newY, count + 1, visited | bit)
        }
    }
}

dfs(0, 0, 1, 1 << board[0][0])
print(result)
