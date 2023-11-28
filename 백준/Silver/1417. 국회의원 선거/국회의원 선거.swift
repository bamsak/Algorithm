struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    var isEmpty: Bool { return array.isEmpty }

    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }

    mutating func enHeap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)

        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }

    mutating func deHeap() -> T? {
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
            let leftChildIndex = index * 2 + 1
            let righChildIndex = leftChildIndex + 1

            var target = index

            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }

            if righChildIndex < array.count && compare(array[righChildIndex], array[target]) {
                target = righChildIndex
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

let n = Int(readLine()!)!
var heap = Heap<Int>(compare: >)

var a = Int(readLine()!)!

for _ in 0..<n - 1 {
    heap.enHeap(Int(readLine()!)!)
}

var result = 0

while !heap.isEmpty {
    let b = heap.deHeap()!
    if a <= b {
        heap.enHeap(b - 1)
        a += 1
        result += 1
    }
}

print(result)
