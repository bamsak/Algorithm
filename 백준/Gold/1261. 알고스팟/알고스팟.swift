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
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let mn = readLine()!.split(separator: " ").map { Int($0)!}
let (m, n) = (mn[0], mn[1])

var map = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    map[i] = readLine()!.map { Int(String($0))! }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]


var heap = Heap<(x: Int, y: Int, weight: Int)> { $0.weight < $1.weight }
var weights = Array(repeating: Array(repeating: Int.max, count: m), count: n)
heap.enheap((0, 0, 0))
weights[0][0] = 0

while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weights[info.y][info.x] { continue }
    
    if info.x == m - 1 && info.y == n - 1 {
        print(weights[info.y][info.x])
        break
    }
    
    for i in 0..<dx.count {
        let newX = dx[i] + info.x
        let newY = dy[i] + info.y
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        
        let newWeight = info.weight + map[newY][newX]
        
        if newWeight >= weights[newY][newX] { continue }
        heap.enheap((newX, newY, newWeight))
        weights[newY][newX] = newWeight
    }
}