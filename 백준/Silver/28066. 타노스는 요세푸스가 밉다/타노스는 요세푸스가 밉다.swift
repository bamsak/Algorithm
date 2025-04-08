struct Queue<T> {
  private var input = [T]()
  private var output = [T]()
  
  var count: Int {
    input.count + output.count
  }
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

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var queue = Queue<Int>()

for i in 1...n {
  queue.enqueue(i)
}

while queue.count > 1 {
  let current = queue.dequeue()!
  
  for _ in 0..<min(k - 1, queue.count) {
    queue.dequeue()
  }
  queue.enqueue(current)
}


print(queue.dequeue()!)