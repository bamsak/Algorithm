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

let hw = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (hw[0], hw[1])
var cheese = Array(repeating: Array(repeating: 0, count: 0), count: h)

for i in 0..<h {
    cheese[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var time = 0
var queue = Queue<(x: Int, y: Int)>()
var previous = 0

while true {
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var count = 0
    
    queue.enqueue((0, 0))
    visited[0][0] = true
    
    while !queue.isEmpty {
        let current = queue.dequeue()
        
        for i in 0..<dx.count {
            let newX = current.x + dx[i]
            let newY = current.y + dy[i]
            
            if newX < 0 || newY < 0 || newX >= w || newY >= h { continue }
            if visited[newY][newX] { continue }
            visited[newY][newX] = true
            
            if cheese[newY][newX] == 1 && cheese[current.y][current.x] == 0 {
                cheese[newY][newX] = 0
                count += 1
                continue
            }
            
            queue.enqueue((newX, newY))
        }
    }
    
    if count == 0 {
        break
    }
    
    time += 1
    previous = count
    
}
print("\(time)\n\(previous)")