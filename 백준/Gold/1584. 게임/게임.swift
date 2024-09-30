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


var map = Array(repeating: Array(repeating: 0, count: 501), count: 501)

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (sx, sy, ex, ey) = (min(xy[0], xy[2]), min(xy[1], xy[3]), max(xy[0], xy[2]), max(xy[1], xy[3]))
    
    for y in sy...ey {
        for x in sx...ex {
            map[y][x] = 1
        }
    }
}

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (sx, sy, ex, ey) = (min(xy[0], xy[2]), min(xy[1], xy[3]), max(xy[0], xy[2]), max(xy[1], xy[3]))
    
    for y in sy...ey {
        for x in sx...ex {
            map[y][x] = 2
        }
    }
}

var weights = Array(repeating: Array(repeating: Int.max, count: 501), count: 501)
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
        
        if newX < 0 || newY < 0 || newX > 500 || newY > 500 { continue }
        if map[newY][newX] == 2 { continue }
        let newWeight = info.weight + map[newY][newX]
        if newWeight >= weights[newY][newX] { continue }
        weights[newY][newX] = newWeight
        heap.enheap((newX, newY, newWeight))
    }
}

print(weights[500][500] == Int.max ? -1 : weights[500][500])