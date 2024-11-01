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

var board = Array(repeating: Array(repeating: 0, count: 0), count: 0)
for _ in 0..<5 {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let s = readLine()!.split(separator: " ").map { Int($0)! }
var queue = Queue<(x: Int, y: Int, last: Int, count: Int)>()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 7), count: 5), count: 5)
let start = (x: s[1], y: s[0])
queue.enqueue((start.x, start.y, 0, 0))
visited[start.y][start.x][0] = true

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var result = -1

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.last == 6 {
        result = current.count
        break
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= 5 || newY >= 5 { continue }
        if board[newY][newX] == -1 { continue }
        
        let next = board[newY][newX] == (current.last + 1) ? current.last + 1 : current.last
        if visited[newY][newX][next] { continue }
        
        visited[newY][newX][next] = true
        queue.enqueue((newX, newY, next, current.count + 1))
    }
}

print(result)