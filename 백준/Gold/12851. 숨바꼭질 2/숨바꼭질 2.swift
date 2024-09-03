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
            input.removeAll()
        }
        return output.removeLast()
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)!}
let (n, k) = (nk[0], nk[1])
var weight = Array(repeating: Int.max, count: 100_001)
var queue = Queue<(x: Int, time: Int)>()

weight[n] = 0
queue.enqueue((n, 0))

var count = 0

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.time > weight[k] { break }
    
    if current.x == k {
        weight[k] = current.time
        count += 1
    }
    
    let temp = [current.x * 2, current.x + 1, current.x - 1]
    
    for newX in temp where newX < 100_001 && newX >= 0 {
        if current.time + 1 > weight[newX] { continue }
        weight[newX] = current.time + 1
        queue.enqueue((newX, current.time + 1))
    }
}

print(weight[k])
print(count)