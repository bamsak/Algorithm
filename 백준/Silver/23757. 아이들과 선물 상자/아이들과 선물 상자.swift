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

var heap = Heap<Int>(compare: >)
var result = "1"

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let N = readLine()!.split(separator: " ").map { Int($0)! }
let M = readLine()!.split(separator: " ").map { Int($0)! }

for ng in N {
    heap.enHeap(ng)
}

var gift = heap.deHeap()!

for child in M {
    if gift < child {
        result = "0"
    } else {
        heap.enHeap(gift - child)
        gift = heap.deHeap()!
    }
}

print(result)
