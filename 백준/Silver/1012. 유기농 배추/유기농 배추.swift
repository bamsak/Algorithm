for _ in 0..<Int(readLine()!)! {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, k) = (mnk[0], mnk[1], mnk[2])
    
    var field = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for _ in 0..<k {
        let xy = readLine()!.split(separator: " ").map { Int($0)! }
        field[xy[1]][xy[0]] += 1
    }
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, -1, 0, 1]
    
    var count = 0
    var stack = [(x: Int, y: Int)]()
    
    for y in 0..<n {
        for x in 0..<m {
            if field[y][x] == 1 {
                stack.append((x, y))
                field[y][x] = 0
                while stack.isEmpty == false {
                    let coord = stack.removeLast()
                    for i in 0..<dx.count {
                        let newX = coord.x + dx[i]
                        let newY = coord.y + dy[i]
                        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
                        if field[newY][newX] != 1 { continue }
                        
                        field[newY][newX] = 0
                        stack.append((newX, newY))
                    }
                }
                count += 1
            }
        }
    }

    print(count)
}
