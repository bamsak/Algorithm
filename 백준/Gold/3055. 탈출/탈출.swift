struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var top: T? {
        if output.isEmpty {
            return input.first
        }
        return output.last
    }
    
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

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])

var map = Array(repeating: Array(repeating: "", count: 0), count: r)

var hQueue = Queue<(x: Int, y: Int, time: Int)>()
var wQueue = Queue<(x: Int, y: Int, time: Int)>()

for y in 0..<r {
    let input = readLine()!.map { String($0) }
    map[y] = input
    
    for x in 0..<c {
        if input[x] == "S" {
            hQueue.enqueue((x, y, 0))
            continue
        }
        
        if input[x] == "*" {
            wQueue.enqueue((x, y, 0))
        }
    }
}

var result = 0
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while !hQueue.isEmpty {
    let current = hQueue.dequeue()
    
    if map[current.y][current.x] == "D" {
        result = current.time
        break
    }
    
    while !wQueue.isEmpty {
        let top = wQueue.top!
        
        if top.time > current.time { break }
        
        let water = wQueue.dequeue()
        
        for i in 0..<dx.count {
            let newX = water.x + dx[i]
            let newY = water.y + dy[i]
            
            if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
            if map[newY][newX] == "D" || map[newY][newX] == "X" || map[newY][newX] == "*" { continue }
            
            wQueue.enqueue((newX, newY, water.time + 1))
            map[newY][newX] = "*"
        }
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
        if map[newY][newX] == "*" || map[newY][newX] == "X" || map[newY][newX] == "S" { continue }
        if map[newY][newX] == "." {
            map[newY][newX] = "S"
        }
        hQueue.enqueue((newX, newY, current.time + 1))
    }
}

print(result == 0 ? "KAKTUS" : result)