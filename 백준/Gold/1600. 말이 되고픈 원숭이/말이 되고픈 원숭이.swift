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

let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map { Int($0)! }
let (w, h) = (wh[0], wh[1])

var map = [[Int]]()

for _ in 0..<h {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

var visited = Array(repeating: Array(repeating: Array(repeating: false, count: w), count: h), count: k + 1)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1 ,0]

let hx = [2, 2, -2, -2, -1, -1, 1, 1]
let hy = [-1, 1, -1, 1, 2, -2, 2, -2]

var queue = Queue<(x: Int, y: Int, k: Int, count: Int)>()
queue.enqueue((0, 0, 0, 0))
visited[0][0][0] = true

var result = -1

while let current = queue.dequeue() {
    if current.x == w - 1 && current.y == h - 1 {
        result = current.count
        break
    }
    
    if current.k < k {
        for i in 0..<hx.count {
            let newX = current.x + hx[i]
            let newY = current.y + hy[i]
            
            if newX < 0 || newY < 0 || newX >= w || newY >= h { continue }
            if map[newY][newX] == 1 { continue }
            if visited[current.k + 1][newY][newX] { continue }
            queue.enqueue((newX, newY, current.k + 1, current.count + 1))
            visited[current.k + 1][newY][newX] = true
        }
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= w || newY >= h { continue }
        if map[newY][newX] == 1 { continue }
        if visited[current.k][newY][newX] { continue }
        queue.enqueue((newX, newY, current.k, current.count + 1))
        visited[current.k][newY][newX] = true
    }
    
}

print(result)
