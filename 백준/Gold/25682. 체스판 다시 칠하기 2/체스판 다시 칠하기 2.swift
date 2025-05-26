let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var board = [[Character]]()

for _ in 0..<n {
  let input = readLine()!.map { $0 }
  board.append(input)
}

var black = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
var white = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for y in 0..<n {
  for x in 0..<m {
    let tempB: Character = (y + x) % 2 == 0 ? "W" : "B"
    let tempW: Character = (y + x) % 2 == 0 ? "B" : "W"
    
    black[y + 1][x + 1] = board[y][x] == tempB ? 0 : 1
    white[y + 1][x + 1] = board[y][x] == tempW ? 0 : 1
  }
}

var result = Int.max

var psumB = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
var psumW = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for y in 1...n {
  for x in 1...m {
    psumB[y][x] = black[y][x] + psumB[y - 1][x] + psumB[y][x - 1] - psumB[y - 1][x - 1]
    psumW[y][x] = white[y][x] + psumW[y - 1][x] + psumW[y][x - 1] - psumW[y - 1][x - 1]
  }
}

for i in 1...n - k + 1 {
  for j in 1...m - k + 1 {
    let tempB = psumB[i + k - 1][j + k - 1] - psumB[i + k - 1][j - 1] - psumB[i - 1][j + k - 1] + psumB[i - 1][j - 1]
    let tempW = psumW[i + k - 1][j + k - 1] - psumW[i + k - 1][j - 1] - psumW[i - 1][j + k - 1] + psumW[i - 1][j - 1]
    result = min(result, tempW, tempB)
  }
}
print(result)