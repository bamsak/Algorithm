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
var map = Array(repeating: Array(repeating: 0, count: 0), count: n)
var virus = [(x: Int, y: Int)]()
for y in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[y] = input
    for x in 0..<m where input[x] == 2 {
        virus.append((x, y))
    }
}

var result = 0
var queue = Queue<(x: Int, y: Int)>()
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func dfs(_ depth: Int) {
    if depth == 3 {
        var temp = map
        virus.forEach { queue.enqueue($0) }
        
        while !queue.isEmpty {
            let current = queue.dequeue()
            
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                
                if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
                if temp[newY][newX] != 0 { continue }
                queue.enqueue((newX, newY))
                temp[newY][newX] = 2
            }
        }
        
        var safeArea = 0
        
        for y in 0..<n {
            for x in 0..<m where temp[y][x] == 0 {
                safeArea += 1
            }
        }
        
        result = max(safeArea, result)
        return
    }
    
    for y in 0..<n {
        for x in 0..<m where map[y][x] == 0 {
            map[y][x] = 1
            dfs(depth + 1)
            map[y][x] = 0
        }
    }
}

dfs(0)
print(result)
