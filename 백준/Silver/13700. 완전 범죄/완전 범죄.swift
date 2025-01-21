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

let nsdfbk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s, d, f, b, k) = (nsdfbk[0], nsdfbk[1] - 1, nsdfbk[2] - 1, nsdfbk[3], nsdfbk[4], nsdfbk[5])
let ps = k > 0 ? readLine()!.split(separator: " ").map { Int($0)! - 1 } : []

var visited = [Bool](repeating: false, count: n)

for p in ps {
    visited[p] = true
}

var result = -1

let direction = [f, -b]
var queue = Queue<(position: Int, count: Int)>()

queue.enqueue((s, 0))
visited[s] = true

while let current = queue.dequeue() {
    if current.position == d {
        result = current.count
        break
    }
    
    for i in 0..<direction.count {
        let new = current.position + direction[i]
        if new < 0 || new >= n { continue }
        if visited[new] { continue }
        
        queue.enqueue((new, current.count + 1))
        visited[new] = true
    }
}

print(result == -1 ? "BUG FOUND" : "\(result)")

