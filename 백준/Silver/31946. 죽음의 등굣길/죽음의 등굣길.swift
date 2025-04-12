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

let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)
var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let x = Int(readLine()!)!
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

var result = "DEAD"

if map[n - 1][m - 1] == map[0][0] {
    var queue = Queue<(x: Int, y: Int)>()
    queue.enqueue((0, 0))
    visited[0][0] = true
    
    while let current = queue.dequeue() {
        if current.x == m - 1 && current.y == n - 1 {
            result = "ALIVE"
            break
        }
        
        for dy in -x...x {
            let newY = current.y + dy
            if newY < 0 || newY >= n { continue }
            
            let remain = x - abs(dy)
            
            for dx in -remain...remain {
                let newX = current.x + dx
                if newX < 0 || newX >= m { continue }
                if visited[newY][newX] || map[newY][newX] != map[current.y][current.x] { continue }
                queue.enqueue((newX, newY))
                visited[newY][newX] = true
            }
        }
        
    }
}

print(result)
