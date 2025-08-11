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

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var map = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
}

var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: k + 1)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var queue = Queue<(x: Int, y: Int, k: Int, count: Int)>()
queue.enqueue((0, 0, 0, 1))
visited[0][0][0] = true

var result = -1
while let current = queue.dequeue() {
    if current.x == m - 1 && current.y == n - 1 {
        result = current.count
        break
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if map[newY][newX] == 1 {
            if current.k < k && !visited[current.k + 1][newY][newX] {
                queue.enqueue((newX, newY, current.k + 1, current.count + 1))
                visited[current.k + 1][newY][newX] = true
            }
            continue
        }
        if visited[current.k][newY][newX] { continue }
        queue.enqueue((newX, newY, current.k, current.count + 1))
        visited[current.k][newY][newX] = true
    }
}

print(result)
