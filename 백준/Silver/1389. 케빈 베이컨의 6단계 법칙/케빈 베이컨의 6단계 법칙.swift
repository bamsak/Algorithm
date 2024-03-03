struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }

    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }

    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var friends = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    friends[ab[0]].append(ab[1])
    friends[ab[1]].append(ab[0])
}

var result = [(user: Int, count: Int)]()

for i in 1...n {
    var queue = Queue<(user: Int, count: Int)>()
    var visited = [Bool](repeating: false, count: n + 1)
    var count = 0

    queue.enqueue((i, count))
    visited[i] = true

    while queue.isEmpty == false {
        let current = queue.dequeue()
        count += current.count

        for friend in friends[current.user] {
            if visited[friend] == false {
                visited[friend] = true
                queue.enqueue((friend, current.count + 1))
            }
        }
    }
    result.append((i, count))
}

print(result.min { $0.count == $1.count ? $0.user < $1.user : $0.count < $1.count }!.user)