struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int {
        input.count + output.count
    }
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

let n = Int(readLine()!)!
var queue = Queue<Int>()

for i in 0..<n {
    queue.enqueue(i + 1)
}

while queue.count > 1 {
    queue.dequeue()
    let a = queue.dequeue()!
    queue.enqueue(a)
}

print(queue.dequeue()!)
