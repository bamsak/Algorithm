struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var first: T {
        if output.isEmpty {
            return input.first!
        }
        return output.last!
    }
    
    mutating func enqueue(_ newelement: T) {
        input.append(newelement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var queue = Queue<(index: Int, prioty: Int)>()
    var count = 0
    
    for i in 0..<nums.count {
        queue.enqueue((i, nums[i]))
    }
    
    var sorted = nums.sorted()
    
    while queue.isEmpty == false {
        let value = queue.dequeue()
        
        if value.index == m {
            if sorted.last! > value.prioty {
                queue.enqueue(value)
                continue
            } else {
                count += 1
                break
            }
        }
        
        if value.prioty == sorted.last! {
            count += 1
            sorted.removeLast()
        } else {
            queue.enqueue(value)
        }
        
    }
    
    print(count)
}
