struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var costs = [Int]()

for _ in 0..<n {
    costs.append(Int(readLine()!)!)
}

var weights = Array(repeating: 0, count: m + 1)
for i in 1...m {
    weights[i] = Int(readLine()!)!
}

var parkingStatus = Array(repeating: -1, count: n)

var queue = Queue<Int>()
var result = 0

for _ in 0..<m * 2 {
    let now = Int(readLine()!)!
    if now > 0 {
        if let empty  = parkingStatus.firstIndex(of: -1) {
            parkingStatus[empty] = now
        } else {
            queue.enqueue(now)
        }
    } else {
        if let temp = parkingStatus.firstIndex(of: abs(now)) {
            result += costs[temp] * weights[abs(now)]
            guard let new = queue.dequeue()
            else {
                parkingStatus[temp] = -1
                continue
            }
            parkingStatus[temp] = new
        }
    }
}

print(result)