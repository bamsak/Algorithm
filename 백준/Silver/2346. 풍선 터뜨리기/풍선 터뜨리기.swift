struct Deque<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }

    mutating func pushBack(_ newElement: T) {
        input.append(newElement)
    }

    mutating func pushFront(_ newElement: T) {
        output.append(newElement)
    }

    mutating func popLast() -> T {
        if input.isEmpty {
            input = output.reversed()
            output = [T]()
        }
        return input.removeLast()
    }

    mutating func popFirst() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

let n = Int(readLine()!)!
let balloons = readLine()!.split(separator: " ").map { Int($0)! }
var deque = Deque<(index: Int, num: Int)>()
var result = ""

for i in 0..<n {
    deque.pushBack((i + 1, balloons[i]))
}

while !deque.isEmpty {
    let current = deque.popFirst()
    result += "\(current.index) "
    if deque.isEmpty { break }
    if current.num > 0 {
        for _ in 0..<current.num - 1 {
            deque.pushBack(deque.popFirst())
        }
    } else {
        for _ in 0..<abs(current.num) {
            deque.pushFront(deque.popLast())
        }
                
    }
}
print(result)
