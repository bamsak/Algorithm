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

var iceberg = Array(repeating: Array(repeating: 0, count: 0), count: n)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for i in 0..<n {
    iceberg[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var queue = Queue<(x: Int, y: Int)>()

var year = 0

while true {
    var count = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var removeArr = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for y in 0..<n {
        for x in 0..<m where iceberg[y][x] != 0 && !visited[y][x] {
            queue.enqueue((x, y))
            visited[y][x] = true
            
            while !queue.isEmpty {
                let current = queue.dequeue()
                
                for i in 0..<dx.count {
                    let newX = current.x + dx[i]
                    let newY = current.y + dy[i]
                    
                    if newX < 0 || newY < 0 || newX >= m || newY >= n {
                        continue
                    }
                    
                    if visited[newY][newX] || iceberg[newY][newX] == 0 { continue }
                    
                    queue.enqueue((newX, newY))
                    visited[newY][newX] = true
                }
            }
            count += 1
        }
    }
    
    if count > 1 {
        print(year)
        break
    }
    if count == 0 {
        print(0)
        break
    }
    
    for y in 0..<n {
        for x in 0..<m where iceberg[y][x] != 0 {
            for i in 0..<dx.count {
                let newX = x + dx[i]
                let newY = y + dy[i]
                
                if iceberg[newY][newX] != 0 { continue }
                removeArr[y][x] += 1
            }
        }
    }
    for y in 0..<n {
        for x in 0..<m where iceberg[y][x] != 0 {
            iceberg[y][x] = iceberg[y][x] - removeArr[y][x] < 0 ? 0 : iceberg[y][x] - removeArr[y][x]
        }
    }

    year += 1
}