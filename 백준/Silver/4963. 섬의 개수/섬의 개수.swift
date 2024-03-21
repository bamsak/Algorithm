while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    if wh == [0, 0] { break }
    
    let (w, h) = (wh[0], wh[1])
    
    var map = Array(repeating: Array(repeating: 0, count: 0), count: h)
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    for i in 0..<h {
        map[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    let mx = [0, 1, 0, -1, 1, 1, -1, -1]
    let my = [1, 0, -1, 0, 1, -1, 1, -1]
    
    var stack = [(x: Int, y: Int)]()
    
    var result = 0
    
    for y in 0..<h {
        for x in 0..<w {
            if map[y][x] == 1 && visited[y][x] == false {
                stack.append((x, y))
                
                while stack.isEmpty == false {
                    let coord = stack.removeLast()
                    if visited[coord.y][coord.x] { continue }
                    visited[coord.y][coord.x] = true
                    
                    for i in 0..<mx.count {
                        let newX = coord.x + mx[i]
                        let newY = coord.y + my[i]
                        
                        if newX < 0 || newY < 0 || newX >= w || newY >= h {
                            continue
                        }
                        if visited[newY][newX] { continue }
                        if map[newY][newX] == 0 { continue }
                        stack.append((newX, newY))
                    }
                }
                result += 1
            }
        }
    }
    print(result)
}
