struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var top: T! {
        if output.isEmpty {
            return input.first
        }
        return output.last
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

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for _ in 0..<Int(readLine()!)! {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, h) = (wh[0], wh[1])
    
    var map = Array(repeating: Array(repeating: "", count: 0), count: h)
    var sQueue = Queue<(x: Int, y: Int, time: Int)>()
    var fQueue = Queue<(x: Int, y: Int, time: Int)>()
    
    var result = 0
    
    for y in 0..<h {
        let input = readLine()!.map { String($0) }
        map[y] = input
        
        for x in 0..<input.count {
            if input[x] == "@" {
                sQueue.enqueue((x, y, 0))
                continue
            }
            
            if input[x] == "*" {
                fQueue.enqueue((x, y, 0))
            }
        }
    }
    
    while !sQueue.isEmpty {
        let current = sQueue.dequeue()
        
        if current.x == 0 || current.x == w - 1 || current.y == 0 || current.y == h - 1  {
            result = current.time + 1
            break
        }
        
        while !fQueue.isEmpty {
            let top = fQueue.top!
            
            if top.time > current.time {
                break
            }
            
            let fire = fQueue.dequeue()

            for i in 0..<dx.count {
                let newX = fire.x + dx[i]
                let newY = fire.y + dy[i]
                
                if newX < 0 || newY < 0 || newX >= w || newY >= h { continue }
                if map[newY][newX] == "#" || map[newY][newX] == "*" { continue }
                fQueue.enqueue((newX, newY, fire.time + 1))
                map[newY][newX] = "*"
            }
        }
        
        for i in 0..<dx.count {
            let newX = current.x + dx[i]
            let newY = current.y + dy[i]
            
            if newX < 0 || newY < 0 || newX >= w || newY >= h { continue }
            if map[newY][newX] == "#" || map[newY][newX] == "*" || map[newY][newX] == "@" { continue }
            
            sQueue.enqueue((newX, newY, current.time + 1))
            map[newY][newX] = "@"
        }
    }
    
    print(result == 0 ? "IMPOSSIBLE" : result)
}