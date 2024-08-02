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
        
        while childIndex > 0, compare(array[childIndex], array[parentIndex]) {
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

let ne = readLine()!.split(separator: " ").map { Int($0)! }
let (n, e) = (ne[0], ne[1])

var edges = Array(repeating: Array(repeating: (vertex: 0, weight: 0), count: 0), count: n + 1)

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    edges[a].append((b, c))
    edges[b].append((a, c))
}

let uv = readLine()!.split(separator: " ").map { Int($0)! }
let (u, v) = (uv[0], uv[1])

var heap = Heap<(vertex: Int, weight: Int)> { $0.weight < $1.weight }

func foo(_ start: Int) -> [Int] {
    var weight = Array(repeating: Int.max, count: n + 1)
    heap.enheap((start, 0))
    weight[start] = 0
    while true {
        guard let info = heap.deheap() else { break }
        
        if info.weight > weight[info.vertex] { continue }
        
        for edge in edges[info.vertex] {
            let newWeight = edge.weight + info.weight
            
            if newWeight < weight[edge.vertex] {
                weight[edge.vertex] = newWeight
                heap.enheap((edge.vertex, newWeight))
            }
        }
        
    }
    return weight
}

let arrS = foo(1)
let arrU = foo(u)
let arrV = foo(v)

let uToV = [arrS[u], arrU[v], arrV[n]]
let vToU = [arrS[v], arrV[u], arrU[n]]

let triggerUToV = validCheck(with: uToV)
let triggerVTOU = validCheck(with: vToU)

if triggerUToV && triggerVTOU {
    print(min(uToV.reduce(0, +), vToU.reduce(0, +)))
} else if triggerUToV && !triggerVTOU {
    print(uToV.reduce(0, +))
} else if !triggerUToV && triggerVTOU {
    print(vToU.reduce(0, +))
} else {
    print(-1)
}

func validCheck(with arr: [Int]) -> Bool {
    for int in arr {
        if int == Int.max {
            return false
        }
    }
    return true
}
