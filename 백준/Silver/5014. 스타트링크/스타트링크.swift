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

let fsgud = readLine()!.split(separator: " ").map { Int($0)! }
let (f, s, g, u, d) = (fsgud[0], fsgud[1], fsgud[2], fsgud[3], fsgud[4])

var visited = Array(repeating: false, count: f + 1)
var queue = Queue<(stair: Int, count: Int)>()
var result = -1

queue.enqueue((s, 0))
visited[s] = true

while queue.isEmpty == false {
    let now = queue.dequeue()
    
    if now.stair == g {
        result = now.count
        break
    }

    let up = now.stair + u
    let down = now.stair - d
    
    if up <= f && visited[up] == false {
        queue.enqueue((up, now.count + 1))
        visited[up] = true
    }

    if down > 0 && visited[down] == false {
        queue.enqueue((down, now.count + 1))
        visited[down] = true
    }
}

print(result != -1 ? result : "use the stairs")
