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

var paper = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    paper[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var count = 0
var area = 0
var queue = Queue<(x: Int, y: Int)>()

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for y in 0..<n {
    for x in 0..<m where paper[y][x] == 1 {
        queue.enqueue((x, y))
        paper[y][x] = 0
        count += 1
        
        var currentArea = 0
        
        while !queue.isEmpty {
            let current = queue.dequeue()
            currentArea += 1
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                
                if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
                if paper[newY][newX] == 0 { continue }
                paper[newY][newX] = 0
                queue.enqueue((newX, newY))
            }
        }
        area = max(area, currentArea)
    }
}

print(count)
print(area)