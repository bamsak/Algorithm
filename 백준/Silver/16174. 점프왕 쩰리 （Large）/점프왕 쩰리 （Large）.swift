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

let n = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var queue = Queue<(x: Int, y: Int)>()

visited[0][0] = true
queue.enqueue((0, 0))

while let current = queue.dequeue() {
    if current.y == n - 1 && current.x == n - 1 { break }
    
    let dx = [map[current.y][current.x], 0]
    let dy = [0, map[current.y][current.x]]
    
    for i in 0..<2 {
        let (newX, newY) = (current.x + dx[i], current.y + dy[i])
        if newX >= n || newY >= n { continue }
        if visited[newY][newX] { continue }
        queue.enqueue((newX, newY))
        visited[newY][newX] = true
    }
}

print(visited[n - 1][n - 1] ? "HaruHaru" : "Hing")
