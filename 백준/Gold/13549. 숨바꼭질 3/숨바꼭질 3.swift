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

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var visited = Array(repeating: false, count: 100_001)

var queue = Queue<(point: Int, time: Int)>()
queue.enqueue((n, 0))
visited[n] = true

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.point == k {
        print(current.time)
        break
    }
    
    if current.point * 2 <= 100_000 && !visited[current.point * 2] {
        queue.enqueue((current.point * 2, current.time))
        visited[current.point * 2] = true
    }
    
    if current.point - 1 >= 0 && !visited[current.point - 1] {
        queue.enqueue((current.point - 1, current.time + 1))
        visited[current.point - 1] = true
    }
    
    if current.point + 1 <= 100_000 && !visited[current.point + 1] {
        queue.enqueue((current.point + 1, current.time + 1))
        visited[current.point + 1] = true
    }
}
