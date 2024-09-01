struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
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
            if index == target { break }
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n + 1)
var weights = Array(repeating: Int.max, count: n + 1)
var parent = Array(repeating: -1, count: n + 1)

for _ in 0..<m {
    let sew = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, e, w) = (sew[0], sew[1], sew[2])
    edges[s].append((e, w))
}

let se = readLine()!.split(separator: " ").map { Int($0)! }
let (s, e) = (se[0], se[1])

var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((s, 0))
weights[s] = 0

var arr = [Int]()

while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weights[info.node] { continue }
    if info.node == e { break }

    for edge in edges[info.node] where edge.weight + info.weight < weights[edge.node] {
        weights[edge.node] = edge.weight + info.weight
        parent[edge.node] = info.node
        heap.enheap((edge.node, edge.weight + info.weight))
    }
}

var route = [Int]()
var node = e

while node != -1 {
    route.append(node)
    node = parent[node]
}

print(weights[e])
print(route.count)
print(route.reversed().map { String($0) }.joined(separator: " "))