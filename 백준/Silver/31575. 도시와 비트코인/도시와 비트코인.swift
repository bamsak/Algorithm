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

var cities = Array(repeating: Array(repeating: 0, count: 0), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

for i in 0..<m {
    let city = readLine()!.split(separator: " ").map { Int($0)! }
    cities[i] = city
}

let mx = [0, 1]
let my = [1, 0]

var queue = Queue<(x: Int, y: Int)>()

var result = "No"

let endPoint = (x: n - 1, y: m - 1)

queue.enqueue((0, 0))

while queue.isEmpty == false {
    let current = queue.dequeue()
    
    if visited[current.y][current.x] { continue }
    
    if current.x == endPoint.x && current.y == endPoint.y {
        result = "Yes"
        break
    }
    
    visited[current.y][current.x] = true
    
    for i in 0..<mx.count {
        let newX = current.x + mx[i]
        let newY = current.y + my[i]
        
        if newX >= n || newY >= m { continue }
        if visited[newY][newX] || cities[newY][newX] == 0 { continue }
        
        queue.enqueue((newX, newY))
    }
    
}
print(result)
