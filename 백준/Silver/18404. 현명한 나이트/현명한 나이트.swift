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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let temp = readLine()!.split(separator: " ").map { Int($0)! }
let knights = (x: temp[1] - 1, y: temp[0] - 1)

let dx = [1, -1, 1, -1, 2, -2, 2, -2]
let dy = [-2, -2, 2, 2, 1, 1, -1, -1]
var ends = [(x: Int, y: Int)]()
for _ in 0..<m {
    let yx = readLine()!.split(separator: " ").map { Int($0)! }
    let (y, x) = (yx[0] - 1, yx[1] - 1)
    ends.append((x, y))
}

var queue = Queue<(x: Int, y: Int, count: Int)>()
var weights = Array(repeating: Array(repeating: Int.max, count: n), count: n)

queue.enqueue((knights.x, knights.y, 0))
weights[knights.y][knights.x] = 0

while let current = queue.dequeue() {
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= n || newY >= n { continue }
        if weights[newY][newX] <= current.count + 1 { continue }
        queue.enqueue((newX, newY, current.count + 1))
        weights[newY][newX] = current.count + 1
    }
}

var result = ""

for end in ends {
    result += "\(weights[end.y][end.x]) "
}

print(result)