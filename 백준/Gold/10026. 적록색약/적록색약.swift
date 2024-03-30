struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        
        return output.removeLast()
    }
}

let n = Int(readLine()!)!

var colors = Array(repeating: Array(repeating: "", count: 0), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var rVisited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
    colors[i] = readLine()!.map { String($0) }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var queue = Queue<(x: Int, y: Int, color: String)>()

var rgb = 0
var gb = 0

for y in 0..<n {
    for x in 0..<n {
        if visited[y][x] == false {
            queue.enqueue((x, y, colors[y][x]))
            visited[y][x] = true
            while queue.isEmpty == false {
                let now = queue.dequeue()
                
                for i in 0..<dx.count {
                    let newX = now.x + dx[i]
                    let newY = now.y + dy[i]
                    
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    
                    if visited[newY][newX] { continue }
                    
                    if now.color != colors[newY][newX] { continue }
                    visited[newY][newX] = true
                    queue.enqueue((newX, newY, colors[newY][newX]))
                }
            }
            rgb += 1
        }
        
        if rVisited[y][x] == false {
            queue.enqueue((x, y, colors[y][x]))
            rVisited[y][x] = true
            while queue.isEmpty == false {
                let now = queue.dequeue()
                
                for i in 0..<dx.count {
                    let newX = now.x + dx[i]
                    let newY = now.y + dy[i]
                    
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    
                    if rVisited[newY][newX] { continue }
                    
                    let newColor = colors[newY][newX]
                    if now.color == "G" || now.color == "R" {
                        if newColor == "G" || newColor == "R" {
                            rVisited[newY][newX] = true
                            queue.enqueue((newX, newY, newColor))
                            continue
                        }
                    }
                    
                    if now.color == "B" {
                        if newColor == "B"{
                            rVisited[newY][newX] = true
                            queue.enqueue((newX, newY, newColor))
                        }
                    }
                }
            }
            gb += 1
        }
    }
}

print("\(rgb) \(gb)")