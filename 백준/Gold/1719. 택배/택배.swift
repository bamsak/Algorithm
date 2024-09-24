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
            array.swapAt(target, index)
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

var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
var result = [[Int]]()

for i in 1...n {
    var weights = Array(repeating: Int.max, count: n + 1)
    var temp = Array(repeating: 0, count: n)
    
    heap.enheap((i, 0))
    weights[i] = 0
    
    while true {
        guard let info = heap.deheap() else { break }
        if info.weight > weights[info.node] { continue }
        
        for edge in edges[info.node] {
            let newWeight = edge.weight + info.weight
            if newWeight < weights[edge.node] {
                heap.enheap((edge.node, newWeight))
                weights[edge.node] = newWeight
                if info.node == i {
                    temp[edge.node - 1] = edge.node
                } else {
                    temp[edge.node - 1] = temp[info.node - 1]
                }
            }
        }
    }
    
    result.append(temp)
}

result.forEach {
    print($0.map { $0 == 0 ? "-" : "\($0)" }.joined(separator: " "))
}

