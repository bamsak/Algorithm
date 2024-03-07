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

var board = Array(repeating: Array(repeating: 0, count: 0), count: 101)
var visited = Array(repeating: false, count: 101)
for _ in 0..<n + m {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    board[xy[0]].append(xy[1])
}

var result = 0
var queue = Queue<(now: Int, count: Int)>()

queue.enqueue((1, 0))
visited[1] = true

while queue.isEmpty == false {
    let now = queue.dequeue()
    
    if now.now == 100 {
        result = now.count
        break
    }
    
    for i in 1...6 {
        let new = now.now + i
        
        if new > 100 || visited[new] { continue }
        
        if board[new].isEmpty {
            queue.enqueue((new, now.count + 1))
            visited[new] = true
            continue
        }
        visited[board[new].last!] = true
        queue.enqueue((board[new].last!, now.count + 1))
    }
}

print(result)