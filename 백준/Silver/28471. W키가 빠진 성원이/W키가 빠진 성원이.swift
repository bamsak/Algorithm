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
var map = [[Character]]()

var start = (x: -1, y: -1)
for y in 0..<n {
    let input = readLine()!.map { $0 }
    map.append(input)
    
    if start == (-1, -1) {
        for x in 0..<n where map[y][x] == "F" {
            start = (x, y)
        }
    }
}

let dx = [1, 0, -1, -1, -1, 1, 1]
let dy = [0, -1, 0, -1, 1, 1, -1]
var queue = Queue<(x: Int, y: Int)>()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

queue.enqueue((start.x, start.y))
visited[start.y][start.x] = true

while let current = queue.dequeue() {
    for i in 0..<dx.count {
        let (newX, newY) = (current.x + dx[i], current.y + dy[i])
        
        if newX < 0 || newY < 0 || newX >= n || newY >= n { continue }
        if visited[newY][newX] || map[newY][newX] == "#" { continue }
        
        visited[newY][newX] = true
        queue.enqueue((newX, newY))
    }
}
var result = 0

for y in 0..<n {
    for x in 0..<n where map[y][x] == "." && visited[y][x] {
        result += 1
    }
}
print(result)