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

for _ in 0..<Int(readLine()!)! {
    let st = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, t) = (st[0], st[1])

    var queue = Queue<(s: Int, t: Int, count: Int)>()
    queue.enqueue((s, t, 0))

    var result = 0

    while queue.isEmpty == false {
        let score = queue.dequeue()

        if score.t - score.s == 0 {
            result = score.count
            break
        }

        let ms = [score.s, 1]
        let mt = [3, 0]

        for i in 0..<ms.count {
            let newS = score.s + ms[i]
            let newT = score.t + mt[i]

            if newT - newS < 0 { continue }
            queue.enqueue((newS, newT, score.count + 1))
        }
    }

    print(result)
}