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

let nd = readLine()!.split(separator: " ").map { Int($0)! }
let (n, d) = (nd[0], nd[1])
var route = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: 10_001)
for _ in 0..<n {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    route[a].append((b, c))
}
var weights = Array(repeating: Int.max, count: d + 1)
var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((0, 0))
weights[0] = 0

while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weights[info.node] { continue }
    
    for r in route[info.node] where r.node <= d {
        let newWeight = r.weight + info.weight
        if newWeight < weights[r.node] {
            heap.enheap((r.node, newWeight))
            weights[r.node] = newWeight
        }
    }
    
    let temp = info.node + 1
    let tWeight = info.weight + 1
    if temp <= d && tWeight < weights[temp] {
        heap.enheap((temp, tWeight))
        weights[temp] = tWeight
    }
}
print(weights[d])