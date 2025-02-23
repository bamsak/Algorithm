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
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]){
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
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
var indegree = [Int](repeating: 0, count: n)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0] - 1, ab[1] - 1)
    edges[a].append(b)
    indegree[b] += 1
}

var heap = Heap<Int>{ $0 < $1 }

for i in 0..<n where indegree[i] == 0 {
    heap.enheap(i)
}

var result = ""
while let current = heap.deheap() {
    if indegree[current] == 0 {
        result += "\(current + 1) "
    }
    
    for edge in edges[current] {
        indegree[edge] -= 1
        if indegree[edge] == 0 {
            heap.enheap(edge)
        }
    }
}

print(result)
