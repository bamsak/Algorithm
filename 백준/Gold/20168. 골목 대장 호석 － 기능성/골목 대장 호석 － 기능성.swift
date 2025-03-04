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

let nmabc = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, a, b, c) = (nmabc[0], nmabc[1], nmabc[2] - 1, nmabc[3] - 1, nmabc[4])
var edges = [[(node: Int, weight: Int)]](repeating: [], count: n)

for _ in 0..<m {
    let uvc = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, c) = (uvc[0] - 1, uvc[1] - 1, uvc[2])
    edges[u].append((v, c))
    edges[v].append((u, c))
}

var heap = Heap<(node: Int, max: Int, total: Int)> { $0.max < $1.max }
var weights = Array(repeating: Array(repeating: Int.max, count: c + 1), count: n)
var result = Int.max

heap.enheap((a, 0, 0))
weights[a][0] = 0

while let current = heap.deheap() {
    if current.total > c || current.max > weights[current.node][current.total] { continue }
    
    if current.node == b {
        result = min(result, current.max)
        continue
    }
    
    for edge in edges[current.node] {
        let newTotal = current.total + edge.weight
        let newMax = max(current.max, edge.weight)
        
        if newTotal <= c && newMax < weights[edge.node][newTotal] {
            heap.enheap((edge.node, newMax, newTotal))
            weights[edge.node][newTotal] = newMax
        }
    }
}

print(result == Int.max ? -1 : result)
