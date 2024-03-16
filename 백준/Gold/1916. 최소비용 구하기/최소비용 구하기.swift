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
            
            if target == index {
                break
            }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)

var cities = Array(repeating: Array(repeating: (d: 0, w: 0), count: 0), count: n + 1)
var weight = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let uvw = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    
    cities[u].append((v, w))
}

let sd = readLine()!.split(separator: " ").map { Int($0)! }
let (start, destination) = (sd[0], sd[1])

var heap = Heap<(d: Int, w: Int)> { $0.w < $1.w }

heap.enheap((start, 0))
weight[start] = 0

while true {
    guard let info = heap.deheap() else { break }
    if info.w > weight[info.d] { continue }
    if info.d == destination { break }
    
    for city in cities[info.d] {
        let newWeight = city.w + info.w
        
        if newWeight < weight[city.d] {
            weight[city.d] = newWeight
            heap.enheap((city.d, newWeight))
        }
    }
}

print(weight[destination])