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

var space = Array(repeating: Array(repeating: 0, count: 0), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    space[i] = input
}

let dx = [0, 1, 0, -1, 1, -1, -1 , 1]
let dy = [1, 0, -1, 0, 1, -1, 1, -1]

var queue = Queue<(x: Int, y: Int, distance: Int)>()

var result = 0

for y in 0..<n {
    for x in 0..<m where space[y][x] == 1 {
        queue.enqueue((x, y, 0))
        visited[y][x] = true
    }
}

while !queue.isEmpty {
    let current = queue.dequeue()
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if visited[newY][newX] { continue }
        
        visited[newY][newX] = true
        queue.enqueue((newX, newY, current.distance + 1))
        result = max(result, current.distance + 1)
    }
}

print(result)