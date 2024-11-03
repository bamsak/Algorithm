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

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var map = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var queue = Queue<(x: Int, y: Int)>()
var result = 0

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for y in 0..<n {
    for x in 0..<m where !visited[y][x] {
        result += 1
        queue.enqueue((x, y))
        visited[y][x] = true
        
        while !queue.isEmpty {
            let current = queue.dequeue()
            
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                
                if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
                if visited[newY][newX] || abs(map[current.y][current.x] - map[newY][newX]) > k { continue }

                visited[newY][newX] = true
                queue.enqueue((newX, newY))
            }
        }
    }
}

print(result)