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

let n = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var weight = Array(repeating: -1, count: n + 1)

while let input = readLine() {
    if input.first! == "-" { break }
    let ab = input.split(separator: " ").map { Int($0)! }
    edges[ab[0]].append(ab[1])
    edges[ab[1]].append(ab[0])
}

var queue = Queue<(f: Int, count: Int)>()

for i in 1...n {
    var visited = Array(repeating: false, count: n + 1)
    queue.enqueue((i, 0))
    visited[i] = true
    
    while !queue.isEmpty {
        let current = queue.dequeue()
        weight[current.f] = max(current.count, weight[current.f])
        
        for edge in edges[current.f] where !visited[edge] {
            visited[edge] = true
            queue.enqueue((edge, current.count + 1))
        }
    }
}

let minScore = weight[1...].min()!
let temp = weight.enumerated().filter { $0.element == minScore }.map { $0.offset }

print("\(minScore) \(temp.count)")
temp.forEach { print($0, terminator: " ") }
