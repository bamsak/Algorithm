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



for _ in 0..<Int(readLine()!)! {
    let ndc = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, d, c) = (ndc[0], ndc[1], ndc[2])
    
    var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n + 1)
    
    for _ in 0..<d {
        let abs = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, s) = (abs[0], abs[1], abs[2])
        
        edges[b].append((a, s))
    }
    
    var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }
    var weights = Array(repeating: Int.max, count: n + 1)
    heap.enheap((c, 0))
    weights[c] = 0
    
    while true {
        guard let info = heap.deheap() else { break }
        if info.weight > weights[info.node] { continue }
        
        for edge in edges[info.node] {
            let newWeight = edge.weight + info.weight
            if newWeight < weights[edge.node] {
                weights[edge.node] = newWeight
                heap.enheap((edge.node, newWeight))
            }
        }
    }
    
    let temp = weights.filter { $0 != Int.max }
    print("\(temp.count) \(temp.max()!)")
}