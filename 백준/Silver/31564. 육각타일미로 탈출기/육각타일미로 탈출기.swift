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
let end = (x: nmk[1], y: nmk[0]), k = nmk[2]
var queue = Queue<(x: Int, y: Int, count: Int)>()
var map = Array(repeating: Array(repeating: false, count: end.x), count: end.y)

for _ in 0..<k {
    let yx = readLine()!.split(separator: " ").map { Int($0)! }
    map[yx[0]][yx[1]] = true
}

let oddX = [0, 1, 1, 1, 0, -1]
let oddY = [-1, -1, 0, 1, 1, 0]

let evenX = [-1, 0, 1, 0, -1, -1]
let evenY = [-1, -1, 0, 1, 1, 0]

map[0][0] = true
queue.enqueue((0, 0, 0))
var result = -1

while !queue.isEmpty {
    let current = queue.dequeue()
    if current.x == end.x - 1 && current.y == end.y - 1 {
        result = current.count
        break
    }
    
    for i in 0..<6 {
        let newX = current.x + (current.y % 2 == 0 ? evenX[i] : oddX[i])
        let newY = current.y + (current.y % 2 == 0 ? evenY[i] : oddY[i])
        
        if newX < 0 || newY < 0 || newX >= end.x || newY >= end.y { continue }
        if map[newY][newX] { continue }
        queue.enqueue((newX, newY, current.count + 1))
        map[newY][newX] = true
    }
}

print(result)