struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int {
        input.count + output.count
    }
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var top: T? {
        if output.isEmpty {
            return input.first
        }
        return output.last
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

let nwl = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w, l) = (nwl[0], nwl[1], nwl[2])
let trucks = readLine()!.split(separator: " ").map { Int($0)! }

var queue = Queue<(truck: Int, time: Int)>()
var result = 0
var currentWeight = 0
var idx = 0

while idx < n || !queue.isEmpty {
    result += 1
    
    if let top = queue.top, result - top.time == w {
        currentWeight -= top.truck
        _ = queue.dequeue()
    }
    
    if idx < n {
        if queue.count < w && currentWeight + trucks[idx] <= l {
            queue.enqueue((truck: trucks[idx], time: result))
            currentWeight += trucks[idx]
            idx += 1
        }
    }
}

print(result)
