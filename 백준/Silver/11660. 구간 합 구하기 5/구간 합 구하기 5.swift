let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var board = [[Int]]()

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var psum = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for y in 1...n {
    for x in 1...n {
        psum[y][x] = board[y - 1][x - 1] + psum[y - 1][x] + psum[y][x - 1] - psum[y - 1][x - 1]
    }
}

var result = ""

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (xy[1], xy[0], xy[3], xy[2])
    
    result += "\(psum[y2][x2] - psum[y1 - 1][x2] - psum[y2][x1 - 1] + psum[y1 - 1][x1 - 1])\n"
}

print(result)