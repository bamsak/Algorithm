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
            
            if target == index {
                break
            }
            
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}

let vep = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e, p) = (vep[0], vep[1], vep[2])

var edges = Array(repeating: Array(repeating: (d: 0, w: 0), count: 0), count: v + 1)

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    
    edges[a].append((b, c))
    edges[b].append((a, c))
}

var masan = 0
var mj = 0
var mtms = 0

for i in 0..<2 {
    var heap = Heap<(d: Int, w: Int)> { $0.w < $1.w }
    var weight = Array(repeating: Int.max, count: v + 1)
    
    if i == 0 {
        heap.enheap((1, 0))
        weight[1] = 0
    } else {
        heap.enheap((p, 0))
        weight[p] = 0
    }
    
    while true {
        guard let now = heap.deheap() else { break }
        if now.w > weight[now.d] { continue }
        
        for edge in edges[now.d] {
            let newWeight = edge.w + now.w
            
            if newWeight < weight[edge.d] {
                weight[edge.d] = newWeight
                heap.enheap((edge.d, newWeight))
            }
        }
    }
    
    if i == 0 {
        masan = weight[v]
        mj = weight[p]
    } else {
        mtms = weight[v]
    }
}

print(masan == mj + mtms ? "SAVE HIM" : "GOOD BYE")