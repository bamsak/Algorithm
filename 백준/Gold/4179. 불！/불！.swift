struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var top: T? {
        if output.isEmpty {
            return input.first
        }
        return output.last
    }
    
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

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])
var maze = Array(repeating: Array(repeating: "", count: 0), count: r)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var jQueue = Queue<(x: Int, y: Int, time: Int)>()
var fQueue = Queue<(x: Int, y: Int, time: Int)>()

for y in 0..<r {
    let input = readLine()!.map { String($0) }
    maze[y] = input
    
    for x in 0..<c {
        if input[x] == "J" {
            jQueue.enqueue((x, y, 0))
            continue
        }
        
        if input[x] == "F" {
            fQueue.enqueue((x, y, 0))
        }
    }
}

var result = 0

while !jQueue.isEmpty {
    let current = jQueue.dequeue()
    
    if current.x == 0 || current.y == 0 || current.x == c - 1 || current.y == r - 1 {
        result = current.time + 1
        break
    }
    
    while !fQueue.isEmpty {
        let top = fQueue.top!
        
        if top.time > current.time {
            break
        }
        
        let fire = fQueue.dequeue()
        
        for i in 0..<dx.count {
            let newX = fire.x + dx[i]
            let newY = fire.y + dy[i]
            
            if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
            if maze[newY][newX] == "#" || maze[newY][newX] == "F" { continue }
            fQueue.enqueue((newX, newY, fire.time + 1))
            maze[newY][newX] = "F"
        }
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
        if maze[newY][newX] == "." {
            jQueue.enqueue((newX, newY, current.time + 1))
            maze[newY][newX] = "J"
        }
    }
}

print(result == 0 ? "IMPOSSIBLE" : result)