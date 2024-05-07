struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        let value = array[0]
        
        array[0] = array.removeLast()
        var index = 0
        
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            
            if rightChildIndex < array.count && compare(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let point = readLine()!.split(separator: " ").map { Int($0)! }
var edges = Array(repeating: Array(repeating: (vertex: 0, weight: 0), count: 0), count: n)
var weights = Array(repeating: Int.max, count: n)

for _ in 0..<m {
    let abt = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, t) = (abt[0], abt[1], abt[2])
    edges[a].append((b, t))
    edges[b].append((a, t))
}

var heap = Heap<(vertex: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((0, 0))

while true {
    guard let info = heap.deheap() else { break }
    
    if info.weight > weights[info.vertex] { continue }
    
    for edge in edges[info.vertex] {
        let newWeight = info.weight + edge.weight
        
        if point[info.vertex] == 0 && newWeight < weights[edge.vertex] {
            weights[edge.vertex] = newWeight
            heap.enheap((edge.vertex, newWeight))
        }
    
    }
}

print(weights[n - 1] == Int.max ? -1 : weights[n - 1])