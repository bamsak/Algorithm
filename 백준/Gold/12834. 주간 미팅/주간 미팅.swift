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
            
            if leftChildIndex < array.count && compare(array[leftChildIndex] , array[target]) {
                target = leftChildIndex
            }
            
            if rightChildIndex < array.count && compare(array[rightChildIndex] , array[target]) {
                target = rightChildIndex
            }
            
            if index == target { break }
            array.swapAt(index, target)
            index = target
        }
        return value
    }
}
 
let nve = readLine()!.split(separator: " ").map { Int($0)! }
let (n, v, e) = (nve[0], nve[1], nve[2])
let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (kist, crFood) = (ab[0], ab[1])
let homes = readLine()!.split(separator: " ").map { Int($0)! - 1 }

var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: v)

for _ in 0..<e {
    let abl = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, l) = (abl[0] - 1, abl[1] - 1, abl[2])
    edges[a].append((b, l))
    edges[b].append((a, l))
}

var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }

func foo(_ node: Int) -> [Int] {
    var weights = Array(repeating: Int.max, count: v)
    heap.enheap((node, 0))
    weights[node] = 0
    
    while let current = heap.deheap() {
        if weights[current.node] < current.weight { continue }
        
        for edge in edges[current.node] {
            let newWeight = current.weight + edge.weight
            if newWeight < weights[edge.node] {
                heap.enheap((edge.node, newWeight))
                weights[edge.node] = newWeight
            }
        }
    }
    return weights
}

let kistWeights = foo(kist)
let crWeights = foo(crFood)

var result = 0

for h in homes {
    let k = kistWeights[h] == Int.max ? -1 : kistWeights[h]
    let c = crWeights[h] == Int.max ? -1 : crWeights[h]
    result += k + c
}

print(result)
