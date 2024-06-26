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
            let rightChildeIndex = leftChildIndex + 1
            var target = index
            
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            
            if rightChildeIndex < array.count && compare(array[rightChildeIndex], array[target]) {
                target = rightChildeIndex
            }
            
            if target == index { break }
            array.swapAt(index, target)
            index = target
        }
        return value
    }
}

var heap = Heap<Int> { $0 < $1 }

for _ in 0..<Int(readLine()!)! {
    heap.enheap(Int(readLine()!)!)
}

var result = 0

while true {
    guard let a = heap.deheap() else { break }
    guard let b = heap.deheap() else { break }
    let new = a + b
    result += new
    heap.enheap(new)
}

print(result)