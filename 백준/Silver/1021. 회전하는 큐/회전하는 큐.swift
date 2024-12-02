struct Deque<T> {
    private var stack = [T]()
    private var queue = [T]()
    
    var queueTop: T? {
        if queue.isEmpty {
            return stack.first
        }
        return queue.last
    }
    
    mutating func append(_ newElement: T) {
        stack.append(newElement)
    }
    
    mutating func enqueue(_ newElement: T) {
        queue.append(newElement)
    }
    
    mutating func popLast() -> T? {
        if stack.isEmpty {
            stack = queue.reversed()
            queue = []
        }
        return stack.popLast()
    }
    
    mutating func dequeue() -> T? {
        if queue.isEmpty {
            queue = stack.reversed()
            stack = []
        }
        return queue.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var leftDeque = Deque<Int>()
var rightDeque = Deque<Int>()

for i in 1...n {
    leftDeque.append(i)
    rightDeque.append(i)
}
var result = 0

for num in nums {
    var (l, r) = (0, 0)
    
    while let top = leftDeque.queueTop, top != num {
        guard let temp = leftDeque.dequeue() else { break }
        l += 1
        leftDeque.append(temp)
    }
    
    while let top = rightDeque.queueTop, top != num {
        guard  let temp = rightDeque.popLast() else { break }
        r += 1
        rightDeque.enqueue(temp)
    }
    
    leftDeque.dequeue()
    rightDeque.dequeue()
    if l < r {
        rightDeque = leftDeque
        result += l
    } else {
        leftDeque = rightDeque
        result += r
    }

}

print(result)
