let rct = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, t) = (rct[0], rct[1], rct[2])
var map = [[Character]]()
var start = (x: -1, y: -1)

for y in 0..<r {
    let input = readLine()!.map { $0 }
    map.append(input)
    if start != (-1, -1) { continue }
    
    for x in 0..<c where input[x] == "G" {
        start = (x, y)
    }
}
var result = 0

let dx = [0, 1, 0, -1, 0]
let dy = [1, 0, -1, 0, 0]

func dfs(_ x: Int, _ y: Int, _ time: Int, _ count: Int) {
    if time == t {
        result = max(result, count)
        return
    }
    
    for i in 0..<dx.count {
        let (newX, newY) = (dx[i] + x, dy[i] + y)
        if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
        if map[newY][newX] == "#" { continue }
        
        if map[newY][newX] == "S" {
            map[newY][newX] = "."
            dfs(newX, newY, time + 1, count + 1)
            map[newY][newX] = "S"
        } else {
            dfs(newX, newY, time + 1, count)
        }
    }
}

dfs(start.x, start.y, 0, 0)

print(result)
