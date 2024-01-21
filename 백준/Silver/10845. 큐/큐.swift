struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        input.count + output.count
    }
    
    var first: T {
        if output.isEmpty {
            return input.first!
        }
        return output.last!
    }
    
    var last: T {
        if input.isEmpty {
            return output.first!
        }
        return input.last!
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

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    
    switch input[0] {
    case "push":
        queue.enqueue(Int(input[1])!)
    case "pop":
        queue.isEmpty ? print(-1) : print(queue.dequeue()!)
    case "size":
        print(queue.count)
    case "empty":
        queue.isEmpty ? print(1) : print(0)
    case "front":
        queue.isEmpty ? print(-1) : print(queue.first)
    default:
        queue.isEmpty ? print(-1) : print(queue.last)
    }
}
