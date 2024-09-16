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
            input.removeAll()
        }
        return output.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var map = Array(repeating: Array(repeating: "", count: 0), count: n)

for i in 0..<n {
    map[i] = readLine()!.map{ String($0) }
}

var result = 0

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
var queue = Queue<(x: Int, y: Int)>()

for y in 0..<n {
    for x in 0..<m where map[y][x] == "L" {
        var weight = Array(repeating: Array(repeating: -1, count: m), count: n)
        queue.enqueue((x, y))
        weight[y][x] = 0
        
        while !queue.isEmpty {
            let current = queue.dequeue()
            result = max(result, weight[current.y][current.x])
            
            for i in 0..<dx.count {
                let newX = dx[i] + current.x
                let newY = dy[i] + current.y
                
                if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
                if map[newY][newX] == "W" || weight[newY][newX] != -1 { continue }
                weight[newY][newX] = weight[current.y][current.x] + 1
                queue.enqueue((newX, newY))
            }
        }
    }
}

print(result)
