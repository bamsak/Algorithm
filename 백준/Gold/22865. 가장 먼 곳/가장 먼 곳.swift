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
            let leftchildIndex = index * 2 + 1
            let rightchildIndex = leftchildIndex + 1
            
            var target = index
            
            if leftchildIndex < array.count && compare(array[leftchildIndex], array[target]) {
                target = leftchildIndex
            }
            
            if rightchildIndex < array.count && compare(array[rightchildIndex], array[target]) {
                target = rightchildIndex
            }
            
            if target == index { break }
            array.swapAt(index, target)
            index = target
        }
        return value
    }
}

let n = Int(readLine()!)!
let abc = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: (vertex: 0, weight: 0), count: 0), count: n + 1)
var weight = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let del = readLine()!.split(separator: " ").map { Int($0)! }
    let (d, e, l) = (del[0], del[1], del[2])
    edges[d].append((e, l))
    edges[e].append((d, l))
}


for now in abc {
    var currentWeight = Array(repeating: Int.max, count: n + 1)
    var heap = Heap<(vertex: Int, weight: Int)> { $0.weight < $1.weight }
    heap.enheap((now, 0))
    
    while true {
        guard let info = heap.deheap() else { break }
        if info.weight > currentWeight[info.vertex] { continue }
        
        for edge in edges[info.vertex] {
            let newWeight = info.weight + edge.weight
            
            if newWeight < currentWeight[edge.vertex] {
                currentWeight[edge.vertex] = newWeight
                heap.enheap((edge.vertex, newWeight))
            }
        }
    }
    
    for i in 1...n {
        weight[i] = min(weight[i], currentWeight[i])
    }
}

let result = weight[1...].enumerated().max {
    if $0.element == $1.element {
        return $0.offset < $1.offset
    }
    return $0.element < $1.element
}!.offset + 1

print(result)