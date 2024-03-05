struct Heap<T> {
    private var array = [T]()
    private var compare: ((T, T) -> Bool)
    
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
        if array.isEmpty {
            return nil
        }
        
        if array.count == 1 {
            return array.removeLast()
        }
        
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

var heap = Heap<Int> {
    if abs($0) == abs($1) {
        return $0 < $1
    }
    return abs($0) < abs($1)
}

var result = ""

for i in 0..<Int(readLine()!)! {
    let num = Int(readLine()!)!
    
    if num != 0 {
        heap.enheap(num)
        continue
    }
    
    guard let value = heap.deheap() else {
        result += "0\n"
        continue
    }
    
    result += "\(value)\n"
}
print(result)