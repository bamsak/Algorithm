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
var indegree = Array(repeating: 0, count: n)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0] - 1, ab[1] - 1)
    edges[a].append(b)
    indegree[b] += 1
}

var dp = [Int](repeating: 1, count: n)
var queue = Queue<Int>()

for i in 0..<n where indegree[i] == 0 {
    queue.enqueue(i)
}

while let current = queue.dequeue() {
    
    for edge in edges[current] {
        indegree[edge] -= 1
        if indegree[edge] == 0 {
            queue.enqueue(edge)
            dp[edge] = dp[current] + 1
        }
    }
}

print(dp.map { String($0) }.joined(separator: " "))
