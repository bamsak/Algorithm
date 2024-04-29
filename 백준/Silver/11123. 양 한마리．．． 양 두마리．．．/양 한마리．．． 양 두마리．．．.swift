for _ in 0..<Int(readLine()!)! {
    let hw = readLine()!.split(separator: " ").map { Int($0)! }
    let (h, w) = (hw[0], hw[1])
    
    var grids = Array(repeating: Array(repeating: "", count: 0) ,count: h)
    
    for i in 0..<h {
        grids[i] = readLine()!.map { String($0) }
    }
    
    var stack = [(x: Int, y: Int)]()
    var result = 0
    
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    for y in 0..<h {
        for x in 0..<w {
            if grids[y][x] == "#" {
                stack.append((x, y))
                
                while !stack.isEmpty {
                    let current = stack.removeLast()
                    grids[current.y][current.x] = "."
                    for i in 0..<dx.count {
                        let newX = current.x + dx[i]
                        let newY = current.y + dy[i]
                        if newX < 0 || newY < 0 || newX >= w || newY >= h { continue }
                        if grids[newY][newX] != "#" { continue }
                        stack.append((newX, newY))
                    }
                }
                result += 1
            }
        }
    }
    print(result)
}