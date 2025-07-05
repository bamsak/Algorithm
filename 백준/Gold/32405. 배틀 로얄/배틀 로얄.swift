struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int {
        input.count + output.count
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

let n = Int(readLine()!)!
let d = readLine()!.split(separator: " ").map { Int($0)! }
let h = readLine()!.split(separator: " ").map { Int($0)! }

var queue = Queue<Int>()
var count = [Int](repeating: 0, count: n)
var totalDamage = 0

for i in 0..<n {
    queue.enqueue(i)
}

while queue.count > 1 {
    guard let current = queue.dequeue() else { break }
    
    let damage = totalDamage - count[current] * d[current]
    let heath = h[current] - damage
    
    if heath <= 0 { continue }
    
    count[current] += 1
    totalDamage += d[current]
    queue.enqueue(current)
}

print(queue.dequeue()! + 1)
