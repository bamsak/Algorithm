let n = Int(readLine()!)!
var paper = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    paper[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func check(x: Int, y: Int, size: Int) -> Bool {
    for i in x..<x + size {
        for j in y..<y + size {
            if paper[i][j] != paper[x][y] {
                return false
            }
        }
    }
    return true
}

func foo(x: Int, y: Int, size: Int) -> (white: Int, blue: Int) {
    if check(x: x, y: y, size: size) {
        return paper[x][y] == 0 ? (1, 0) : (0, 1)
    }
    
    var white = 0
    var blue = 0
    
    let dx = [x, x + size / 2]
    let dy = [y, y + size / 2]
    
    for i in 0..<2 {
        for j in 0..<2 {
            let temp = foo(x: dx[i], y: dy[j], size: size / 2)
            white += temp.white
            blue += temp.blue
        }
    }
    
    return (white, blue)
}

let result = foo(x: 0, y: 0, size: n)
print("\(result.white)\n\(result.blue)")