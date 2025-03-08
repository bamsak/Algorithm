struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

let n = Int(readLine()!)!
var tasks = Array(repeating: Array(repeating: 0, count: 0), count: n)
var indegree = [Int](repeating: 0, count: n)
var times = [Int](repeating: 0, count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    times[i] = input[0]
    indegree[i] = input[1]
    
    for t in input[2...] {
        tasks[t - 1].append(i)
    }
}

var dp = times

var queue = Queue<Int>()
for i in 0..<n where indegree[i] == 0 {
    queue.enqueue(i)
}

while let current = queue.dequeue() {
    
    for task in tasks[current] {
        indegree[task] -= 1
        dp[task] = max(dp[task], dp[current] + times[task])
        if indegree[task] == 0 {
            queue.enqueue(task)
        }
    }
}

print(dp.max()!)
