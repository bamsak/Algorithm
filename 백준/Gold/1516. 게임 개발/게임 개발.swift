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

let n = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
var inDegree = Array(repeating: 0, count: n)
var weights = Array(repeating: 0, count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let time = input[0]
    weights[i] = time
    
    for j in 1..<input.count - 1 {
        edges[input[j] - 1].append(i)
        inDegree[i] += 1
    }
}

var queue = Queue<Int>()
for i in 0..<n where inDegree[i] == 0 {
    queue.enqueue(i)
}

var result = Array(repeating: 0, count: n)

while let current = queue.dequeue() {
    
    for edge in edges[current] {
        inDegree[edge] -= 1
        result[edge] = max(result[edge], result[current] + weights[current])
        
        if inDegree[edge] == 0 {
            queue.enqueue(edge)
        }
    }
}

for i in 0..<n {
    print(result[i] + weights[i])
}
