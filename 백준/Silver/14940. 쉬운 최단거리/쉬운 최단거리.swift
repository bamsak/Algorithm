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
var map = Array(repeating: Array(repeating: 0, count: 0), count: 0)
var result = Array(repeating: Array(repeating: Int.max, count: m), count: n)
var queue = Queue<(x: Int, y: Int, distance: Int)>()

for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
    for x in 0..<m {
        if input[x] == 0 {
            result[y][x] = 0
            continue
        }
        if input[x] == 2 {
            queue.enqueue((x, y, 0))
            result[y][x] = 0
            continue
        }
    }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while !queue.isEmpty {
    let current = queue.dequeue()
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n {
            continue
        }
        
        let newDistance = current.distance + 1
        if result[newY][newX] <= newDistance { continue }
        result[newY][newX] = newDistance
        queue.enqueue((newX, newY, newDistance))
    }
}
result.forEach {
    print($0.map { $0 == Int.max ? "-1" : "\($0)"}.joined(separator: " "), terminator: "\n")
}