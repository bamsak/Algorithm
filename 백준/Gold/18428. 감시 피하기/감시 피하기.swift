let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: "", count: 0), count: n)
var t = [(x: Int, y: Int)]()
var empty = [(x: Int, y: Int)]()
for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    map[y] = input
    for x in 0..<n {
        if input[x] == "T" {
            t.append((x, y))
            continue
        }
        if input[x] == "X" {
            empty.append((x, y))
        }
    }
}

var result = "NO"

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func find() -> Bool {
    for ct in t {
        for i in 0..<dx.count{
            var newX = ct.x
            var newY = ct.y
            
            while true {
                newX += dx[i]
                newY += dy[i]
                
                if newX < 0 || newY < 0 || newX >= n || newY >= n { break }
                if map[newY][newX] == "O" { break }
                if map[newY][newX] == "S" {
                    return true
                }
            }
        }
    }
    return false
}
func dfs(_ start: Int,_ count: Int) {
    if count == 3 {
        if !find() {
            result = "YES"
        }
        return
    }
    
    for i in start..<empty.count {
        let current = empty[i]
        map[current.y][current.x] = "O"
        dfs(i + 1, count + 1)
        map[current.y][current.x] = "X"
    }
}
dfs(0, 0)
print(result)
