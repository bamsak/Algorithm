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
    let nab = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, a, b) = (nab[0], nab[1], nab[2])
    
    var che = Array(repeating: true, count: 100_001)
    che[0] = false
    che[1] = false
    for i in 2...100_000 {
        if !che[i] { continue }
        for j in stride(from: i * i, through: 100_000, by: i) {
            che[j] = false
        }
    }
    
    var result = -1

    var vistited = Array(repeating: false, count: 1_000_001)
    var queue = Queue<(life: Int, count: Int)>()
    
    queue.enqueue((n, 0))
    vistited[n] = true
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        if now.life == 0 {
            continue
        }
        if now.life >= a && now.life <= b && che[now.life] {
            result = now.count
            break
        }
        
        let temp = [now.life / 2, now.life / 3, now.life + 1, now.life - 1]
        
        for i in 0..<temp.count {
            let new = temp[i]
            
            if new < 2 || new > 1_000_000 { continue }
            if vistited[new] { continue }
            vistited[new] = true
            queue.enqueue((new, now.count + 1))
        }
    }
    print(result)
}
