struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var first: T? {
        if array.isEmpty { return nil }
        return array.first
    }
    var count: Int {
        array.count
    }
    
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
    
    @discardableResult
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
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}

let n = Int(readLine()!)!

var heap = Heap<Int> { $0 < $1 }
var times = [(start: Int, end: Int)]()

for _ in 0..<n {
    let time = readLine()!.split(separator: " ").map { Int($0)! }
    times.append((time[0], time[1]))
}

times.sort { $0.start < $1.start }

for time in times {
    if let first = heap.first, time.start >= first {
        heap.deheap()
    }
    heap.enheap(time.end)
}

print(heap.count)