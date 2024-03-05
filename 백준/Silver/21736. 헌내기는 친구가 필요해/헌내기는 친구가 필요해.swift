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

var campus = Array(repeating: Array(repeating: "", count: 0), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n {
    let input = readLine()!.map { String($0) }
    campus[i] = input
}


var check = false
var queue = Queue<(x: Int, y: Int)>()

for x in 0..<m {
    if check { break }
    for y in 0..<n {
        if campus[y][x] == "I" {
            queue.enqueue((x, y))
            visited[y][x] = true
            check = true
            break
        }
    }
}

let mx = [0, 1, 0, -1]
let my = [1, 0, -1, 0]

var count = 0

while queue.isEmpty == false {
    let coord = queue.dequeue()
    
    for i in 0..<mx.count {
        let newX = coord.x + mx[i]
        let newY = coord.y + my[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n {
            continue
        }
        if visited[newY][newX] { continue }
        
        if campus[newY][newX] == "X" {
            visited[newY][newX] = true
            continue
        }
        
        if campus[newY][newX] == "P" {
            count += 1
        }
        
        queue.enqueue((newX, newY))
        visited[newY][newX] = true
    }
}

print(count == 0 ? "TT" : count)
