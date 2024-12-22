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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var map = [[Int]]()
var weights = Array(repeating: Array(repeating: Int.max, count: m), count: n)

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)!})
}

if map[0][0] == -1 {
    print(-1)
} else {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    var heap = Heap<(x: Int, y: Int, weight: Int)> { $0.weight < $1.weight }
    
    heap.enheap((0, 0, map[0][0]))
    weights[0][0] = map[0][0]
    
    while let current = heap.deheap() {
        if current.weight > weights[current.y][current.x] {
            continue
        }
        
        for i in 0..<dx.count {
            let (newX, newY) = (dx[i] + current.x, dy[i] + current.y)
            if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
            if map[newY][newX] == -1 { continue }
            let newWeight = current.weight + map[newY][newX]
            
            if newWeight < weights[newY][newX] {
                weights[newY][newX] = newWeight
                heap.enheap((newX, newY, newWeight))
            }
        }
    }
    
    weights[n - 1][m - 1] == Int.max ? print(-1) : print(weights[n - 1][m - 1])
}
