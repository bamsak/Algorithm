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

let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var weights = Array(repeating: Array(repeating: Int.max, count: n), count: n)

var heap = Heap<(x: Int, y: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((0, 0, 0))
weights[0][0] = 0

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weights[info.y][info.x] { continue }
    
    for i in 0..<dx.count {
        let newX = dx[i] + info.x
        let newY = dy[i] + info.y
        
        if newX < 0 || newY < 0 || newX >= n || newY >= n { continue }
        let temp = abs(map[info.y][info.x] - map[newY][newX])
        let newWeight = max(temp, info.weight)
        if newWeight >= weights[newY][newX] { continue }
        weights[newY][newX] = newWeight
        heap.enheap((newX, newY, newWeight))
    }
}

print(weights[n - 1][n - 1])