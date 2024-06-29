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

let nht = readLine()!.split(separator: " ").map { Int($0)! }
let (n, h, t) = (nht[0], nht[1], nht[2])
var heap = Heap<Int>(compare: >)

for _ in 0..<n {
    heap.enheap(Int(readLine()!)!)
}

var count = 0
for _ in 0..<t {
    guard let value = heap.deheap() else { break }
    if value < h { 
        heap.enheap(value)
        break
    }
    if value == 1 {
        heap.enheap(1)
        continue
    }
    let new = value / 2
    heap.enheap(new)
    count += 1
}

let last = heap.deheap()!

last < h ? print("YES\n\(count)") : print("NO\n\(last)")
