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
var queue = Queue<(p: Int, w: Int)>()
var priorities = Array(repeating: 0, count: m)

for _ in 0..<n {
    let pw = readLine()!.split(separator: " ").map { Int($0)! }
    queue.enqueue((pw[0], pw[1]))
    priorities[pw[0] - 1] += 1
}

var stack = [(p: Int, w: Int)]()
var result = 0

for i in (0..<m).reversed() where priorities[i] != 0 {
    while !queue.isEmpty && priorities[i] != 0 {
        let current = queue.dequeue()
        result += current.w

        if current.p - 1 < i {
            queue.enqueue(current)
            continue
        }

        priorities[current.p - 1] -= 1

        var temp = [(p: Int, w: Int)]()
        while let last = stack.last, last.p == current.p && last.w < current.w {
            let l = stack.removeLast()
            temp.append(l)
            result += l.w
        }
        stack.append(current)
        stack += temp.reversed()
        result += temp.reduce(0) { $0 + $1.w }
    }
}

print(result)