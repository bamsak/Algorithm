struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    init(_ compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (array.count - 1) / 2
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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let coord = readLine()!.split(separator: " ").map { Int($0)! }
let start = (y: coord[0] - 1, x: coord[1] - 1)
let end = (y: coord[2] - 1, x: coord[3] - 1)

var map = [[Character]]()
var weights = Array(repeating: Array(repeating: Int.max, count: m), count: n)

for _ in 0..<n {
    map.append(readLine()!.map { $0 })
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var heap = Heap<(x: Int, y: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((start.x, start.y, 0))
weights[start.y][start.x] = 0


while true {
    guard let info = heap.deheap() else { break }
    if info.weight > weights[info.y][info.x] { continue }
    if map[info.y][info.x] == "#" { break }
    
    for i in 0..<dx.count {
        let newX = info.x + dx[i]
        let newY = info.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if map[newY][newX] == "#" {
            weights[newY][newX] = info.weight + 1
            heap.enheap((newX, newY, info.weight))
            continue
        }
        guard let w = Int(String(map[newY][newX])) else { continue }
        
        let newWeight = w + info.weight
        
        if newWeight >= weights[newY][newX] { continue }
        weights[newY][newX] = newWeight
        heap.enheap((newX, newY, newWeight))
    }
}

print(weights[end.y][end.x])