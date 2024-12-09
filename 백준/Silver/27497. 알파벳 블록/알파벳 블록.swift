struct Deque<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func pushBack(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func pushFront(_ newElement: T) {
        output.append(newElement)
    }
    
    mutating func popLast() -> T? {
        if input.isEmpty {
            input = output.reversed()
            output = []
        }
        return input.popLast()
    }
    
    mutating func popFirst() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
}

var tapped = [Int]()
var deque = Deque<String>()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if input.count == 1 {
        guard let tap = tapped.popLast() else { continue }
        if tap == 1 {
            _ = deque.popLast()
        } else {
            _ = deque.popFirst()
        }
        continue
    }
    
    let temp = Int(input[0])!
    
    if temp == 1 {
        deque.pushBack(input[1])
    } else {
        deque.pushFront(input[1])
    }
    tapped.append(temp)
}

var result = ""
while let char = deque.popFirst() {
    result += char
}

print(result.isEmpty ? "\(0)" : result )