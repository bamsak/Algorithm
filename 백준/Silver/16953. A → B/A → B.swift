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

let ab = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (ab[0], ab[1])

var visited = Array(repeating: false, count: b + 1)

var result = -1

var queue = Queue<(num: Int, count: Int)>()

queue.enqueue((a, 0))
visited[a] = true

while !queue.isEmpty {
    let current = queue.dequeue()

    if current.num == b {
        result = current.count + 1
        break
    }
    
    let temp = [Int("\(current.num)1")!, current.num * 2]
    
    for i in 0..<temp.count {
        let new = temp[i]
        
        if new > b {
            continue
        }
        if visited[new] {
            continue
        }
        visited[new] = true
        queue.enqueue((new, current.count + 1))
    }
}
print(result)
