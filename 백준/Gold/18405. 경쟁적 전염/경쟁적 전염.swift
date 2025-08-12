struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var map = [[Int]]()
var points = Array(repeating: Array(repeating: (x: 0, y: 0, value: 0), count: 0), count: k + 1)

for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for x in 0..<input.count where input[x] != 0 {
        points[input[x]].append((x, y, input[x]))
    }
    map.append(input)
}

let syx = readLine()!.split(separator: " ").map { Int($0)! }
let (s, y, x) = (syx[0], syx[1] - 1, syx[2] - 1)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var queue = Queue<(x: Int, y: Int, count: Int, value: Int)>()

points[1...].forEach {
    $0.forEach {
        queue.enqueue(($0.x, $0.y, 0, $0.value))
    }
}

while let current = queue.dequeue() {
    if current.count == s {
        break
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newX >= n || newY < 0 || newY >= n { continue }
        if map[newY][newX] != 0 { continue }
        
        map[newY][newX] = current.value
        queue.enqueue((newX, newY, current.count + 1, current.value))
    }
}

print(map[y][x])
