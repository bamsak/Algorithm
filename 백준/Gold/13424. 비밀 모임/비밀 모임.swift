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
            let rightChildeIndex = leftChildIndex + 1
            var target = index
            
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            
            if rightChildeIndex < array.count && compare(array[rightChildeIndex], array[target]){
                target = rightChildeIndex
            }
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n + 1)
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, c) = (abc[0], abc[1], abc[2])
        edges[a].append((b, c))
        edges[b].append((a, c))
    }
    
    let k = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    
    var weights = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
    
    var heap = Heap<(node: Int, weight: Int)>(<)
    
    for start in 1...n {
        heap.enheap((start, 0))
        weights[start][start] = 0
        
        while true {
            guard let info = heap.deheap() else {
                break
            }
            if weights[start][info.node] < info.weight {
                continue
            }
            
            for edge in edges[info.node] {
                let newWeight = edge.weight + info.weight
                if newWeight < weights[start][edge.node] {
                    heap.enheap((edge.node, newWeight))
                    weights[start][edge.node] = newWeight
                }
            }
        }
    }
    
    var result = 0
    var distance = Int.max
    
    for i in 1...n {
        var sum = 0
        
        for num in nums {
            sum += weights[i][num]
        }
        if distance > sum {
            distance = sum
            result = i
        }
    }
    print(result)
}
