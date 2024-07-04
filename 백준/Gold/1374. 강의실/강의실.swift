struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var count: Int {
        return array.count
    }
    
    var top: T? {
        if array.isEmpty { return nil }
        return array.first
    }
    
    init(compare: @escaping (T, T) -> Bool) {
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
    
    mutating func deheap () -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        let value = array[0]
        array[0] = array.removeLast()
        var index = 0
        
        while true {
            let leftChildIndex = index * 2 + 1
            let righChildIndex = leftChildIndex + 1
            var target = index
            
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            
            if righChildIndex < array.count && compare(array[righChildIndex], array[target]) {
                target = righChildIndex
            }
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

var lessons = [(start: Int, end: Int)]()

for _ in 0..<Int(readLine()!)! {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    lessons.append((abc[1], abc[2]))
}

lessons.sort { $0.start < $1.start }

var heap = Heap<Int>(compare: <)

for lesson in lessons {
    if let top = heap.top, lesson.start >= top {
        _ = heap.deheap()
    }
    heap.enheap(lesson.end)
}

print(heap.count)