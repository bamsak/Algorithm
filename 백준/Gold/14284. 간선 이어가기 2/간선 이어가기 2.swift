struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(_ compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast()}
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
            
            if index == target { break }
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n + 1)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    edges[a].append((b, c))
    edges[b].append((a, c))
}

let st = readLine()!.split(separator: " ").map { Int($0)! }
let (s, t) = (st[0], st[1])

var weight = Array(repeating: Int.max, count: n + 1)
var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((s, 0))
weight[s] = 0

while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weight[info.node] { continue }
    if info.node == t {
        break
    }
    for edge in edges[info.node] {
        let newWeight = edge.weight + info.weight
        if newWeight < weight[edge.node] {
            weight[edge.node] = newWeight
            heap.enheap((edge.node, newWeight))
        }
    }
}

print(weight[t])
