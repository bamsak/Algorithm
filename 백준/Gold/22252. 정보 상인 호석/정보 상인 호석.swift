struct Heap<T: Hashable> {
    private var array = [T]()
    private var compare: (T, T) -> Bool
    
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
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
}

var result = 0
var dict = [String: Heap<Int>]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    let (i, name, count) = (Int(input[0])!, String(input[1]), Int(input[2])!)
    
    if i == 1 {
        if dict[name] == nil {
            var heap = Heap<Int>(compare: >)
            input[3...].forEach {
                heap.enheap(Int(String($0))!)
            }
            dict[name] = heap
        } else {
            input[3...].forEach {
                dict[name]!.enheap(Int(String($0))!)
            }
        }
    } else {
        if dict[name] != nil {
            for _ in 0..<count {
                guard let value = dict[name]?.deheap() else { break }
                result += value
            }
        }
    }
}

print(result)