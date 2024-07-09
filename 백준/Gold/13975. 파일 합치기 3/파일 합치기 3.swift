struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
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

for _ in 0..<Int(readLine()!)! {
    let _ = Int(readLine()!)!
    let pages = readLine()!.split(separator: " ").map { Int($0)! }
    var heap = Heap<Int>(compare: <)
    var result = 0
    
    for page in pages {
        heap.enheap(page)
    }
    
    while true {
        guard let first = heap.deheap() else { break }
        guard let second = heap.deheap() else { break }
        result += first + second
        heap.enheap(first + second)
    }
    
    print(result)
}