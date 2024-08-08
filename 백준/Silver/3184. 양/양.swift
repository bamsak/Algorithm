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

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])

var map = Array(repeating: Array(repeating: "", count: 0), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)

var queue = Queue<(x: Int, y: Int)>()

for y in 0..<r {
    let input = readLine()!.map { String($0) }
    map[y] = input
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var sheep = 0
var wolf = 0

for y in 0..<r {
    for x in 0..<c where map[y][x] != "#" && !visited[y][x] {
        queue.enqueue((x, y))
        visited[y][x] = true
        var vCount = 0
        var oCount = 0
        
        while !queue.isEmpty {
            let current = queue.dequeue()

            if map[current.y][current.x] == "v" {
                vCount += 1
            }
            if map[current.y][current.x] == "o" {
                oCount += 1
            }
            
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                
                if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
                if visited[newY][newX] || map[newY][newX] == "#" { continue }
                
                queue.enqueue((newX, newY))
                visited[newY][newX] = true
            }
        }
        if vCount == 0 && oCount == 0 { continue }
        if oCount > vCount {
            sheep += oCount
        } else {
            wolf += vCount
        }

    }
}

print("\(sheep) \(wolf)")