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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
var visited = Array(repeating: 0, count: n)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1}
    edges[ab[0]].append(ab[1])
    visited[ab[1]] += 1
}

var queue = Queue<Int>()

for i in 0..<n where visited[i] == 0 {
    queue.enqueue(i)
}
var result = ""
while let current = queue.dequeue() {
    result += "\(current + 1) "
    
    for edge in edges[current] {
        visited[edge] -= 1
        if visited[edge] == 0 {
            queue.enqueue(edge)
        }
    }
}
print(result)