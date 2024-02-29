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

for _ in 0..<Int(readLine()!)! {
    let i = Int(readLine()!)!
    var chessBoard = Array(repeating: Array(repeating: false, count: i), count: i)
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let destination = readLine()!.split(separator: " ").map { Int($0)! }
    
    var queue = Queue<(x: Int, y: Int, count: Int)>()
    queue.enqueue((start[0], start[1], 0))
    
    let mx = [2, 2, -2, -2, 1, 1, -1, -1]
    let my = [1, -1, 1, -1, 2, -2, 2, -2]
    
    var result = 0
    
    chessBoard[start[1]][start[0]] = true
    
    while queue.isEmpty == false {
        let coord = queue.dequeue()
        
        if coord.x == destination[0] && coord.y == destination[1] {
            result = coord.count
            break
        }
        
        for j in 0..<mx.count {
            let newX = coord.x + mx[j]
            let newY = coord.y + my[j]
            
            if newX < 0 || newY < 0 || newX >= i || newY >= i { continue }
            if chessBoard[newY][newX] == true { continue }
            
            chessBoard[newY][newX] = true
            queue.enqueue((newX, newY, coord.count + 1))
        }
    }
    print(result)
}
