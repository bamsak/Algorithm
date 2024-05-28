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
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    edges[a].append(b)
    edges[b].append(a)
}

var queue = Queue<(point: Int, distance: Int)>()
var result = [(num: Int, distance: Int)]()


queue.enqueue((1, 0))
visited[1] = true

while !queue.isEmpty {
    let current = queue.dequeue()
    var trigger = true
    
    for edge in edges[current.point] where !visited[edge] {
        trigger = false
        queue.enqueue((edge, current.distance + 1))
        visited[edge] = true
    }
    
    if trigger {
        result.append((current.point, current.distance))
    }
}

result.sort {
    if $0.distance == $1.distance {
        return $0.num < $1.num
    }
    return $0.distance > $1.distance
}

result = result.filter { result[0].distance == $0.distance }

print("\(result[0].num) \(result[0].distance) \(result.count)")