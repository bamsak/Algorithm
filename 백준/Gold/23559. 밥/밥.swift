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

let nx = readLine()!.split(separator: " ").map { Int($0)! }
var (n, x) = (nx[0], nx[1])

var heap = Heap<(a: Int, b: Int, gap: Int)> {
    if $0.gap == $1.gap {
        return $0.a > $1.b
    }
    return $0.gap > $1.gap
}

for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    heap.enheap((ab[0], ab[1], ab[0] - ab[1]))
}

var result = 0

for i in 0..<n {
    let remain = n - 1 - i
    guard let value = heap.deheap() else { break }
    
    if value.gap <= 0 {
        result += value.b
        x -= 1000
        continue
    }
    
    if x - 5000 >= remain * 1000 {
        result += value.a
        x -= 5000
        continue
    }
    
    result += value.b
    x -= 1000
}

print(result)