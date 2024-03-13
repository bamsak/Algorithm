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
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast()}
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        
        while true {
            let leftChildIndex = (index * 2) + 1
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


let mx = [0, 1, 0, -1]
let my = [1, 0, -1, 0]

var result = [Int]()
while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    
    var caves = Array(repeating: Array(repeating: 0, count: 0), count: n)
    var weight = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    var heap = Heap<(x: Int, y: Int, w: Int)>  { $0.w < $1.w }
    
    for i in 0..<n {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        caves[i] = r
    }
    
    heap.enheap((0, 0, caves[0][0]))
    weight[0][0] = caves[0][0]
    
    while true {
        guard let now = heap.deheap() else { break }
        if now.x == n - 1 && now.y == n - 1 { break }
        if now.w > weight[now.y][now.x] { continue }
        
        for i in 0..<mx.count {
            let newX = mx[i] + now.x
            let newY = my[i] + now.y
            
            if newX < 0 || newY < 0 || newX >= n || newY >= n { continue }
            
            let newWeight = caves[newY][newX] + now.w
            
            if newWeight < weight[newY][newX] {
                weight[newY][newX] = newWeight
                heap.enheap((newX, newY, newWeight))
            }
        }
    }
    result.append(weight[n - 1][n - 1])
}

for i in 1...result.count {
    print("Problem \(i): \(result[i - 1])")
}