struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(_ compare: @escaping (T, T) -> Bool) {
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

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var heap = Heap<Int> { $0 > $1 }

for _ in 0..<n {
    heap.enheap(Int(readLine()!)!)
}

var previous = 0
var result = [Int]()
while true {
    guard var current = heap.deheap() else { break }
    
    let s = previous / 2 + current
    previous = s
    result.append(s)
    current -= m
    
    if current <= k { continue }
    heap.enheap(current)
}

print(result.count)
print(result.map { String($0) }.joined(separator: "\n"))