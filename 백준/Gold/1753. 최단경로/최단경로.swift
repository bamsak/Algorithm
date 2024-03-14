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
        
        while array.count > 0 && compare(array[childIndex], array[parentIndex]) {
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
            
            if index == target {
                break
            }
            
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}


let ve = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e, k) = (ve[0], ve[1], Int(readLine()!)!)

var edges = Array(repeating: Array(repeating: (d: 0, w: 0), count: 0), count: v + 1)
var weight = Array(repeating: Int.max, count: v + 1)

for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    
    edges[u].append((v, w))
}

var heap = Heap<(d: Int, w: Int)> { $0.w < $1.w }

heap.enheap((k, 0))
weight[k] = 0

while true {
    guard let now = heap.deheap() else { break }
    
    for edge in edges[now.d] {
        let newWeight = edge.w + now.w
        if newWeight < weight[edge.d] {
            weight[edge.d] = newWeight
            heap.enheap((edge.d, newWeight))
        }
    }
}

weight[1...].forEach {
    print($0 != Int.max ? $0 : "INF")
}
