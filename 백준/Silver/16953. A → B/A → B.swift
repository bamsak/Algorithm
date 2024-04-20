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

var result = -1

var queue = Queue<(num: Int, count: Int)>()

queue.enqueue((a, 0))

while !queue.isEmpty {
    let current = queue.dequeue()

    if current.num == b {
        result = current.count + 1
        break
    }
    
    if current.num * 2 <= b {
        queue.enqueue((current.num * 2, current.count + 1))
    }
    
    if Int("\(current.num)1")! <= b {
        queue.enqueue((Int("\(current.num)1")!, current.count + 1))
    }
}
print(result)
