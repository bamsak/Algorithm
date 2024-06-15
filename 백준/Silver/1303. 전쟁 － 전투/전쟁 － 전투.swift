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
var ground = Array(repeating: Array(repeating: "", count: 0), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

for i in 0..<m {
    let input = readLine()!.map { String($0) }
    ground[i] = input
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var queue = Queue<(x: Int, y: Int)>()
var dict = ["W": 0, "B": 0]
for y in 0..<m {
    for x in 0..<n where !visited[y][x] {
        if ground[y][x] == "W" {
            var wCount = 1
            queue.enqueue((x, y))
            visited[y][x] = true
            while !queue.isEmpty {
                let current = queue.dequeue()
                for i in 0..<dx.count {
                    let newX = dx[i] + current.x
                    let newY = dy[i] + current.y
                    
                    if newX < 0 || newY < 0 || newX >= n || newY >= m {
                        continue
                    }
    
                    if visited[newY][newX] || ground[newY][newX] != "W" { continue }
                    queue.enqueue((newX, newY))
                    visited[newY][newX] = true
                    wCount += 1
                }
            }
            dict["W"]! += wCount * wCount
        } else {
            var bCount = 1
            queue.enqueue((x, y))
            visited[y][x] = true
            while !queue.isEmpty {
                let current = queue.dequeue()
                for i in 0..<dx.count {
                    let newX = dx[i] + current.x
                    let newY = dy[i] + current.y
                    
                    if newX < 0 || newY < 0 || newX >= n || newY >= m {
                        continue
                    }
                    
                    if visited[newY][newX] || ground[newY][newX] != "B" { continue }
                    queue.enqueue((newX, newY))
                    visited[newY][newX] = true
                    bCount += 1
                }
            }
            dict["B"]! += bCount * bCount
        }
    }
}

print("\(dict["W"]!) \(dict["B"]!)")
