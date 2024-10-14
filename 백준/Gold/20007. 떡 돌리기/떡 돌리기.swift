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
            
            if target == index { break }
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
}

let nmxy = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, x, y) = (nmxy[0], nmxy[1], nmxy[2], nmxy[3])

var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    edges[a].append((b, c))
    edges[b].append((a, c))
}
var weights = Array(repeating: Int.max, count: n)

var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }

heap.enheap((y, 0))
weights[y] = 0

while let info = heap.deheap() {
    if info.weight > weights[info.node] { continue }
    
    for edge in edges[info.node] {
        let newWeight = info.weight + edge.weight
        if newWeight < weights[edge.node] {
            weights[edge.node] = newWeight
            heap.enheap((edge.node, newWeight))
        }
    }
}

weights.sort()
var result = 1
var move = 0
for i in 0..<n {
    if weights[i] == Int.max || weights[i] * 2 > x {
        result = -1
        break
    }
    if move + (weights[i] * 2) > x {
        move = weights[i] * 2
        result += 1
    } else {
        move += (weights[i] * 2)
    }
}

print(result)