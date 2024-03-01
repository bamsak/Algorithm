let n = Int(readLine()!)!

var town = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let apart = readLine()!.map { Int(String($0))! }
    town[i] = apart
}

var result = [Int]()

let mx = [-1, 0, 1, 0]
let my = [0, -1, 0, 1]

var current = 1

for y in 0..<n {
    for x in 0..<n {
        if town[y][x] == 1 {
            dfs(x: x, y: y)
            result.append(current)
            current = 1
        }
    }
}

func dfs(x: Int, y: Int) {
    town[y][x] = 0
    for i in 0..<mx.count {
        let newX = x + mx[i]
        let newY = y + my[i]
        
        if newX < 0 || newY < 0 || newX >= n || newY >= n { continue }
        if town[newY][newX] != 1 { continue }
        current += 1
        
        dfs(x: newX, y: newY)
    }
}

print("\(result.count)\n\(result.sorted().map { String($0) }.joined(separator: "\n"))")