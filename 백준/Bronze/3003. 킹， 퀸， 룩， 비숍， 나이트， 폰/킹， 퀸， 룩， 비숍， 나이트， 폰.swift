let chess = [1, 1, 2, 2, 2, 8]
let piece = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""

for i in 0..<chess.count {
    result += "\(chess[i] - piece[i]) "
}

print(result)