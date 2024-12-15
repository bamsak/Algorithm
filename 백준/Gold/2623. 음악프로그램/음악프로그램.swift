struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T){
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
var inDegree = Array(repeating: 0, count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    
    for i in 1..<input.count - 1 {
        edges[input[i]].append(input[i + 1])
        inDegree[input[i + 1]] += 1
    }
}

var count = 0
var result = ""
var queue = Queue<Int>()

for i in 0..<n where inDegree[i] == 0 {
    queue.enqueue(i)
}

while let current = queue.dequeue() {
    result += "\(current + 1)\n"
    count += 1
    
    for edge in edges[current] {
        inDegree[edge] -= 1
        if inDegree[edge] == 0 {
            queue.enqueue(edge)
        }
    }
}

count == n ? print(result) : print(0)
