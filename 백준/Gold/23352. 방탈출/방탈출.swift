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
var map = Array(repeating: Array(repeating: 0, count: 0), count: n)
for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var queue = Queue<(x: Int, y: Int)>()
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var maxWeight = -1
var result = -1

for y in 0..<n {
    for x in 0..<m where map[y][x] != 0 {
        var weights = Array(repeating: Array(repeating: -1, count: m), count: n)
        queue.enqueue((x, y))
        weights[y][x] = 0
        
        while !queue.isEmpty {
            let current = queue.dequeue()
            
            for i in 0..<dx.count {
                let newX = dx[i] + current.x
                let newY = dy[i] + current.y
                
                if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
                if map[newY][newX] == 0 || weights[newY][newX] != -1 { continue }
                queue.enqueue((newX, newY))
                weights[newY][newX] = weights[current.y][current.x] + 1
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if weights[i][j] > maxWeight  {
                    maxWeight = weights[i][j]
                    result = map[i][j] + map[y][x]
                    continue
                }
                if weights[i][j] == maxWeight {
                    result = max(result, map[i][j] + map[y][x])
                }
            }
        }
    }
}

print(result == -1 ? 0 : result)
