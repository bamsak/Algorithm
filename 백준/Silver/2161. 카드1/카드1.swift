struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
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

var queue = Queue<Int>()

for i in 0..<Int(readLine()!)! {
    queue.enqueue(i + 1)
}

while queue.isEmpty == false {
    print(queue.dequeue()!, terminator: " ")
    if queue.count > 0 {
        queue.enqueue(queue.dequeue()!)
    }
}
