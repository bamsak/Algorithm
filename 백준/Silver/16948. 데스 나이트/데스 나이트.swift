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
let coord = readLine()!.split(separator: " ").map { Int($0)! }
let now = (x: coord[0], y: coord[1])
let end = (x: coord[2], y: coord[3])

var board = Array(repeating: Array(repeating: false, count: n), count: n)
var result = -1

var queue = Queue<(x: Int, y: Int, count: Int)>()
queue.enqueue((now.x, now.y, 0))
board[now.y][now.x] = true

let dx = [-2, -2, 0, 0, 2, 2]
let dy = [-1, 1, -2, 2, -1, 1]

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if (current.x, current.y) == end {
        result = current.count
        break
    }
    
    for i in 0..<dx.count {
        let newX = dx[i] + current.x
        let newY = dy[i] + current.y
        
        if newX < 0 || newY < 0 || newX >= n || newY >= n {
            continue
        }
        if board[newY][newX] { continue }
        queue.enqueue((newX, newY, current.count + 1))
        board[newY][newX] = true
    }
}

print(result)