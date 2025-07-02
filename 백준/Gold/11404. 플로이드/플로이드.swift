struct Heap<T> {
  private var arr = [T]()
  private let compare: (T, T) -> Bool
  
  init(_ compare: @escaping (T, T) -> Bool) {
    self.compare = compare
  }
  
  mutating func enheap(_ newElement: T) {
    var childIndex = arr.count
    var parentIndex = (arr.count - 1) / 2
    arr.append(newElement)
    
    while childIndex > 0 && compare(arr[childIndex], arr[parentIndex]) {
      arr.swapAt(childIndex, parentIndex)
      childIndex = parentIndex
      parentIndex = (childIndex - 1) / 2
    }
  }
  
  mutating func deheap() -> T? {
    if arr.isEmpty { return nil }
    if arr.count == 1 { return arr.removeLast() }
    let value = arr[0]
    arr[0] = arr.removeLast()
    var index = 0
    
    while true {
      let leftChildIndex = index * 2 + 1
      let rightChildIndex = leftChildIndex + 1
      var target = index
      
      if leftChildIndex < arr.count && compare(arr[leftChildIndex], arr[target]) {
        target = leftChildIndex
      }
      
      if rightChildIndex < arr.count && compare(arr[rightChildIndex], arr[target]) {
        target = rightChildIndex
      }
      
      if index == target { break }
      arr.swapAt(index, target)
      index = target
    }
    return value
  }
}

let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)
var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n)

for _ in 0..<m {
  let abc = readLine()!.split(separator: " ").map { Int($0)! }
  let (a, b, c) = (abc[0] - 1, abc[1] - 1, abc[2])
  edges[a].append((b, c))
}

var weights = Array(repeating: Array(repeating: Int.max, count: n), count: n)
var heap = Heap<(node: Int, weight: Int)> { $0.weight < $1.weight }

for i in 0..<n {
  heap.enheap((i, 0))
  weights[i][i] = 0
  
  while let current = heap.deheap() {
    if current.weight > weights[i][current.node] { continue }
    
    for edge in edges[current.node] {
      let newWeight = current.weight + edge.weight
      
      if newWeight < weights[i][edge.node] {
        heap.enheap((edge.node, newWeight))
        weights[i][edge.node] = newWeight
      }
      
    }
  }
}

weights.forEach {
  print($0.map  { $0 == Int.max ? "0" : "\($0)"}.joined(separator: " "))
}

