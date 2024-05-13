struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(_ compare: @escaping (T, T) -> Bool) {
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
            let leftChildIndex = (index * 2) + 1
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

let nmx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, x) = (nmx[0], nmx[1], nmx[2])

var weight = Array(repeating: Int.max, count: n + 1)
var edges = Array(repeating: Array(repeating: (vertex: 0, weight: 0), count: 0), count: n + 1)

for _ in 0..<m {
    let set = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, e, t) = (set[0], set[1], set[2])
    edges[s].append((e, t))
}

var heap = Heap<(vertex: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((x, 0))

while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weight[info.vertex] { continue }
    
    for edge in edges[info.vertex] {
        let newWeight = edge.weight + info.weight
        
        if newWeight < weight[edge.vertex] {
            weight[edge.vertex] = newWeight
            heap.enheap((edge.vertex, newWeight))
        }
    }
}

for i in 1...n where i != x {
    var backWeight = Array(repeating: Int.max, count: n + 1)
    heap.enheap((i, 0))
    
    while true {
        guard let current = heap.deheap() else { break }
        if current.weight > backWeight[current.vertex] { continue }
        for edge in edges[current.vertex] {
            let newWeight = current.weight + edge.weight
            
            if newWeight < backWeight[edge.vertex] {
                backWeight[edge.vertex] = newWeight
                heap.enheap((edge.vertex, newWeight))
            }
        }
    }
    
    weight[i] += backWeight[x]
}

print(weight[1...].max()!)