struct Queue {
    var input = [Int]()
    var output = [Int]()
    
    var count: Int {
        input.count + output.count
    }
    
    mutating func enqueue(_ data: Int) {
        input.append(data)
    }
    
    mutating func dequeue() -> Int? {
        if output.isEmpty {
            output = input.reversed()
            input = [Int]()
        }
        return output.removeLast()
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }

var queue = Queue()
var result = ""

for i in 1...nk[0] {
    queue.enqueue(i)
}

while queue.count != 0 {
    for _ in 0..<nk[1] - 1 {
        let data = queue.dequeue()!
        queue.enqueue(data)
    }
    let data = queue.dequeue()!
    result += "\(data), "
}
result.removeLast()
result.removeLast()
print("<\(result)>")