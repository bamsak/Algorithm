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
            input = [T]()
        }
        return output.removeLast()
    }
}

let nmkx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k, x) = (nmkx[0], nmkx[1], nmkx[2], nmkx[3])
var cities = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var weights = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    cities[a].append(b)
}

var result = [Int]()
var queue = Queue<(city: Int, distance: Int)>()
queue.enqueue((x, 0))
weights[x] = 0

while !queue.isEmpty {
    let current = queue.dequeue()
    
    if current.distance == k {
        result.append(current.city)
    }
    
    for city in cities[current.city] where weights[city] > current.distance + 1 {
        weights[city] = current.distance + 1
        queue.enqueue((city, current.distance + 1))
    }
}

result.isEmpty ? print("-1") : result.sorted().forEach{ print($0) }