struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var count: Int { array.count }
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(parentIndex, childIndex)
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

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var arr = [(v: Int, c: Int)]()
for _ in 0..<k {
    let vc = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((vc[0], vc[1]))
}
arr.sort { $0.c < $1.c }

var heap = Heap<(v: Int, c: Int)> { $0.v < $1.v }

var level = -1
var preference = 0

for beer in arr {
    heap.enheap(beer)
    preference += beer.v
    if heap.count > n {
        preference -= heap.deheap()!.v
    }
    
    if heap.count == n && preference >= m {
        level = beer.c
        break
    }
}

print(level)
