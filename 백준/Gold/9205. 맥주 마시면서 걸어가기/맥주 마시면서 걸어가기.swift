struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ newElemnt: T) {
        input.append(newElemnt)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

for _ in 0..<Int(readLine()!)! {
    let s = Int(readLine()!)!
    let hc = readLine()!.split(separator: " ").map { Int($0)! }
    
    var stores = Array(repeating: (x: 0, y: 0), count: s)
    var visited = Array(repeating: false, count: s)
    var queue = Queue<(x: Int, y: Int)>()
    
    for i in 0..<s {
        let sc = readLine()!.split(separator: " ").map { Int($0)! }
        stores[i] = (sc[0], sc[1])
    }
    
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    
    if abs(hc[0] - rc[0]) + abs(hc[1] - rc[1]) <= 1000 {
        print("happy")
        continue
    }
    
    var trigger = false
    
    queue.enqueue((hc[0], hc[1]))
    
    while !queue.isEmpty {
        let current = queue.dequeue()
        
        if abs(current.x - rc[0]) + abs(current.y - rc[1]) <= 1000 {
            trigger = true
            break
        }
        
        for i in 0..<s {
            let distance = abs(current.x - stores[i].x) + abs(current.y - stores[i].y)
            
            if distance > 1000 || visited[i] { continue }
            visited[i] = true
            queue.enqueue((stores[i].x, stores[i].y))
        }
    }
    
    trigger ? print("happy") : print("sad")
}