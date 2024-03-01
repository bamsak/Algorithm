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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var maze = Array(repeating: Array(repeating: 0, count: 0), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    maze[i] = input
}

var result = 0

var queue = Queue<(x: Int, y: Int, count: Int)>()
queue.enqueue((0, 0, 1))

let mx = [-1, 0, 1, 0]
let my = [0, 1, 0, -1]

while queue.isEmpty == false {
    let coord = queue.dequeue()
    
    if visited[coord.y][coord.x] == true { continue }
    if maze[coord.y][coord.x] != 1 { continue }
    
    if coord.x == m - 1 && coord.y == n - 1{
        result = coord.count
        break
    }
    
    visited[coord.y][coord.x] = true
    
    for i in 0..<mx.count {
        let newX = coord.x + mx[i]
        let newY = coord.y + my[i]
        
        if newX < 0 || newY < 0 || newX >= m ||
            newY >= n { continue }
        if visited[newY][newX] == true { continue }
        
        queue.enqueue((newX, newY, coord.count + 1))
    }
}

print(result)