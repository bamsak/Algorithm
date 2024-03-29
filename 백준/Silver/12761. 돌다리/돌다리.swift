struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ newElemnet: T) {
        input.append(newElemnet)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

let abnm = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, n, m) = (abnm[0], abnm[1], abnm[2], abnm[3])

var visited = Array(repeating: false, count: 100001)

var queue = Queue<(stone: Int, count: Int)>()

queue.enqueue((n, 0))
visited[n] = true

var result = 0

while queue.isEmpty == false {
    let now = queue.dequeue()
    
    if now.stone == m {
        result = now.count
        break
    }
    
    let newStones = [now.stone + 1, now.stone - 1, now.stone + a, now.stone - a, now.stone + b, now.stone - b, now.stone * a, now.stone * b]
    
    for i in 0..<newStones.count {
        let new = newStones[i]
        
        if new < 0 || new >= 100001 {
            continue
        }
        
        if visited[new] { continue }
        
        queue.enqueue((new, now.count + 1))
        visited[new] = true
    }
}

print(result)
