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

var store = Array(repeating: Array(repeating: 0, count: 0), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

for i in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    store[i] = line
}

let mx = [0, 1, 0, -1]
let my = [1, 0, -1, 0]

var queue = Queue<(x: Int, y: Int, count: Int)>()

var totalCount = n * m

for y in 0..<m {
    for x in 0..<n {
        if store[y][x] == -1 {
            totalCount -= 1
            continue
        }
        if store[y][x] == 1 {
            queue.enqueue((x, y, 0))
            visited[y][x] = true
        }
    }
}

var count = 0
var result = 0

while queue.isEmpty == false {
    let now = queue.dequeue()
    if store[now.y][now.x] == 1 {
        count += 1
    }
    for i in 0..<mx.count {
        let newX = now.x + mx[i]
        let newY = now.y + my[i]
        
        if newX < 0 || newY < 0 || newX >= n || newY >= m { continue }
        if visited[newY][newX] == true { continue }
        if store[newY][newX] == -1 { continue }
        
        visited[newY][newX] = true

        if store[newY][newX] == 0 {
            store[newY][newX] = 1
        }
        queue.enqueue((newX, newY, now.count + 1))
    }
    result = now.count
}

print(totalCount == count ? result : "-1")