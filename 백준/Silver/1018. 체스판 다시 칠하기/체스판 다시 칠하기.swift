let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var board = Array(repeating: Array(repeating: "", count: 0), count: n)

for i in 0..<n {
    board[i] = readLine()!.map { String($0) }
}

var result = Int.max

for y in 0...n - 8 {
    for x in 0...m - 8 {
        var temp1 = 0
        var temp2 = 0

        for i in y..<y + 8 {
            for j in x..<x + 8 {
                if (i + j) % 2 == 0 {
                    if board[i][j] == "B" {
                        temp1 += 1
                    } else {
                        temp2 += 1
                    }
                } else {
                    if board[i][j] == "B" {
                        temp2 += 1
                    } else {
                        temp1 += 1
                    }
                }
            }
        }

        result = min(temp1, temp2, result)
    }
}
print(result)