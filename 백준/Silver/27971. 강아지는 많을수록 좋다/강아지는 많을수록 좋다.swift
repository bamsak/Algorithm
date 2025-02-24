struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
}

let nmab = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, a, b) = (nmab[0], nmab[1], nmab[2], nmab[3])


var temp = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
    let lr = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r) = (lr[0], lr[1])
    
    for i in l...r {
        temp[i] = true
    }
}

var result = -1
var queue = Queue<(dog: Int, count: Int)>()

queue.enqueue((0, 0))

while let current = queue.dequeue() {
    if current.dog == n {
        result = current.count
        break
    }
    
    let newA = current.dog + a
    let newB = current.dog + b
    
    if newA <= n && !temp[newA] {
        temp[newA] = true
        queue.enqueue((newA, current.count + 1))
    }
    
    if newB <= n && !temp[newB] {
        temp[newB] = true
        queue.enqueue((newB, current.count + 1))
    }
}

print(result)
