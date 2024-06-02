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

let ak = readLine()!.split(separator: " ").map { Int($0)! }
let (a, k) = (ak[0], ak[1])
var visited = Array(repeating: false, count: 1_000_001)
var queue = Queue<(a: Int, count: Int)>()
queue.enqueue((a, 0))
visited[a] = true

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.a == k {
        print(current.count)
        break
    }
    
    let sum = current.a + 1
    let mul = current.a * 2
    
    if mul < 1_000_001 && !visited[mul] {
        queue.enqueue((mul, current.count + 1))
        visited[mul] = true
    }
    if sum < 1_000_001 && !visited[sum] {
        queue.enqueue((sum, current.count + 1))
        visited[sum] = true
    }
    
}
