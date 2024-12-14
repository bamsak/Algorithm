struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
}

var board = [[Int]]()

for _ in 0..<5 {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var result = -1
var queue = Queue<(x: Int, y: Int, count: Int)>()
let yx = readLine()!.split(separator: " ").map { Int($0)! }, (x, y) = (yx[1], yx[0])

queue.enqueue((x, y, 0))
board[y][x] = -1

while let current = queue.dequeue() {
    if board[current.y][current.x] == 1 {
        result = current.count
        break
    }
    
    for i in 0..<dx.count {
        let (newX, newY) = (dx[i] + current.x, dy[i] + current.y)
        if newX < 0 || newY < 0 || newX >= 5 || newY >= 5 { continue }
        if board[newY][newX] == -1 { continue }
        queue.enqueue((newX, newY, current.count + 1))
        if board[newY][newX] == 0 {
            board[newY][newX] = -1
        }
    }
}

print(result)
