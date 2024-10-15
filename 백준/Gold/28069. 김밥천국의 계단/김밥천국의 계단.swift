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

var result = "water"

var queue = Queue<(num: Int, time: Int)>()
var visited = Array(repeating: false, count: n + 1)
queue.enqueue((0, 0))
visited[0] = true

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.time > k {
        break
    }
    
    if current.num == n {
        result = "minigimbob"
        break
    }
    
    let temp1 = current.num + (current.num / 2)
    let temp2 = current.num + 1
    
    if temp1 <= n && !visited[temp1] {
        queue.enqueue((temp1, current.time + 1))
        visited[temp1] = true
    }
    
    if temp2 <= n && !visited[temp2] {
        queue.enqueue((temp2, current.time + 1))
        visited[temp2] = true
    }
}

print(result)
