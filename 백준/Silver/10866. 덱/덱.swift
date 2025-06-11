struct Deque<T> {
    private var input = [T]()
    
    var isEmpty: Bool {
        input.isEmpty
    }
    
    var count: Int {
        input.count
    }
    
    var front: T? {
        input.first
    }
    
    var back: T? {
        input.last
    }
    
    mutating func pushBack(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func popFirst() -> T? {
        return input.isEmpty ? nil : input.removeFirst()
    }
    
    mutating func pushFront(_ newElement: T) {
        input.insert(newElement, at: 0)
    }
    
    mutating func popLast() -> T? {
        return input.popLast()
    }
}

var deque = Deque<Int>()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
    case "push_front":
        deque.pushFront(Int(input[1])!)
    case "push_back":
        deque.pushBack(Int(input[1])!)
    case "pop_front":
        print(deque.popFirst() ?? -1)
    case "pop_back":
        print(deque.popLast() ?? -1)
    case "size":
        print(deque.count)
    case "empty":
        print(deque.isEmpty ? 1 : 0)
    case "front":
        print(deque.front ?? -1)
    case "back":
        print(deque.back ?? -1)
    default:
        break
    }
}
