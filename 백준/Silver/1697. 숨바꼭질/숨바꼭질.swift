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

var visited = Array(repeating: false, count: 100001)

var result = 0

var queue = Queue<(x: Int, count: Int)>()
queue.enqueue((n, 0))
visited[n] = true

while queue.isEmpty == false {
    let current = queue.dequeue()
    
    if k - current.x == 0 {
        result = current.count
        break
    }
    
    let ms = [-1, 1, current.x]
    
    for i in 0..<ms.count {
        let newX = current.x + ms[i]
        
        if newX < 0 || newX > 100000 { continue }
        if visited[newX] == true { continue }
        
        queue.enqueue((newX, current.count + 1))
        visited[newX] = true
    }
}

print(result)