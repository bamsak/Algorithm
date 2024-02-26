struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int {
        input.count + output.count
    }
    
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

var queue = Queue<(name: String, num: Int)>()

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ")
    queue.enqueue(("\(xy[0])", Int(xy[1])!))
}

while queue.count != 1 {
    let student = queue.dequeue()
    
    for _ in 0..<student.num - 1 {
        let value = queue.dequeue()
        queue.enqueue(value)
    }
    
    let _ = queue.dequeue()
}

let result = queue.dequeue().name
print(result)