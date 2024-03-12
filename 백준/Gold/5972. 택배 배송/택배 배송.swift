struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var farms = Array(repeating: Array(repeating: (farm: 0, cow: 0), count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])

    farms[a].append((b, c))
    farms[b].append((a, c))
}

var heap = Heap<(farm: Int, cow: Int)> {
    $0.cow < $1.cow
}

var result = Array(repeating: Int.max, count: n + 1)
result[1] = 0
heap.enheap((1, 0))

while heap.isEmpty == false {
    guard let now = heap.deheap() else { break }
    
    if visited[now.farm] == true { continue }
    visited[now.farm] = true
    
    for next in farms[now.farm] {
        if visited[next.farm] == false && result[next.farm] > result[now.farm] + next.cow {
            result[next.farm] = result[now.farm] + next.cow
            heap.enheap((next.farm, result[next.farm]))
        }
    }
}

print(result[n])