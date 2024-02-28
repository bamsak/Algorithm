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

var result = ""

while true {
    let lrc = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r, c) = (lrc[0], lrc[1], lrc[2])

    if lrc == [0, 0, 0] { break }

    var building = Array(repeating: Array(repeating: Array(repeating: "", count: c), count: r), count: l)
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: l)
    
    var queue = Queue<(z: Int, y: Int, x: Int, minutes: Int)>()
    
    for i in 0..<l {
        for j in 0...r {
            let load = readLine()!.map { String($0) }
            if load.isEmpty { continue }
            building[i][j] = load
            if load.contains("S") {
                let idx = load.firstIndex(of: "S")!
                queue.enqueue((i, j, idx, 0))
            }
        }
    }
    
    let dx = [0, 0, -1, 0, 1, 0]
    let dy = [0, 0, 0, -1, 0, 1]
    let dz = [-1, 1, 0, 0, 0, 0]
    
    var check = false
    
    while queue.isEmpty == false {
        if check == true { break }
        
        let coord = queue.dequeue()
        if visited[coord.z][coord.y][coord.x] { continue }
        visited[coord.z][coord.y][coord.x] = true
        
        for i in 0..<dx.count {
            let newx = coord.x + dx[i]
            let newy = coord.y + dy[i]
            let newz = coord.z + dz[i]
            
            if newx < 0 || newy < 0 || newz < 0 || newx >= c || newy >= r || newz >= l { continue }
            
            if building[newz][newy][newx] == "E" {
                check = true
                result += "Escaped in \(coord.minutes + 1) minute(s).\n"
                break
            }
            guard visited[newz][newy][newx] == false,
                  building[newz][newy][newx] == "." else { continue }
            
            queue.enqueue((newz, newy, newx, coord.minutes + 1))
        }
    }
    
    if check == false { result += "Trapped!\n" }
}

print(result)