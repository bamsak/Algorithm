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

let mnh = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n, h) = (mnh[0], mnh[1], mnh[2])

var store = Array(repeating: Array(repeating: Array(repeating: 0, count: 0), count: n), count: h)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: h)

for z in 0..<h {
    for y in 0..<n {
        let m = readLine()!.split(separator: " ").map { Int($0)! }
        store[z][y] = m
    }
}
var queue = Queue<(x: Int, y: Int, z: Int, count: Int)>()

var totalCount = m * n * h

for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if store[z][y][x] == -1 {
                totalCount -= 1
                continue
            }
            
            if store[z][y][x] == 1 {
                queue.enqueue((x, y, z, 0))
                visited[z][y][x] = true
            }
        }
    }
}

var count = 0
var result = 0

let mx = [0, 0, 0, 1, -1, 0]
let my = [0, 0, 1, 0, 0, -1]
let mz = [1, -1, 0, 0, 0, 0]

while queue.isEmpty == false {
    let now = queue.dequeue()
    
    if store[now.z][now.y][now.x] == 1 {
        count += 1
    }
    
    for i in 0..<mx.count {
        let newX = now.x + mx[i]
        let newY = now.y + my[i]
        let newZ = now.z + mz[i]
        
        if newX < 0 || newY < 0 || newZ < 0 || newX >= m || newY >= n || newZ >= h {
             continue
        }
        if visited[newZ][newY][newX] == true || store[newZ][newY][newX] == -1 {
            continue }
        
        visited[newZ][newY][newX] = true
        
        if store[newZ][newY][newX] == 0 {
            store[newZ][newY][newX] = 1
        }
        
        queue.enqueue((newX, newY, newZ, now.count + 1))
    }
    result = now.count
}

print(totalCount == count ? result : -1)