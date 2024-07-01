struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var top: T? {
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
        var childindex = array.count
        var parentIndex = (childindex - 1) / 2
        array.append(newElement)
        
        while childindex > 0 && compare(array[childindex], array[parentIndex]) {
            array.swapAt(childindex, parentIndex)
            childindex = parentIndex
            parentIndex = (childindex - 1) / 2
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
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let n = Int(readLine()!)!
var heap = Heap<Int>(compare: <)
var lessons = [(start: Int, end: Int)]()

for _ in 0..<n {
    let st = readLine()!.split(separator: " ").map { Int($0)! }
    lessons.append((st[0], st[1]))
}

lessons.sort { $0.start < $1.start }

for lesson in lessons {
    if let end = heap.top, lesson.start >= end {
        _ = heap.deheap()
    }
    heap.enheap(lesson.end)
}

print(heap.count)