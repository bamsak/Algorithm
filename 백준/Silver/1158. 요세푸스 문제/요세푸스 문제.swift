struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var size: Int {
        input.count + output.count
    }
    
    mutating func enqueue(_ data: T) {
        input.append(data)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}

var queue = Queue<Int>()
let nk = readLine()!.split(separator: " ").map{ Int($0)! }
var result = ""

for i in 1...nk[0] {
    queue.enqueue(i)
}

while queue.size != 0 {
    for _ in 0..<(nk[1] - 1) {
        let data = queue.dequeue()!
        queue.enqueue(data)
    }
    result += "\(queue.dequeue()!), "
}

result.removeLast()
result.removeLast()

print("<\(result)>")
