let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n, q) = (nq[0], nq[1])

var visited = Array(repeating: false, count: n + 1)

for _ in 0..<q {
    let land = Int(readLine()!)!
    var result = 0
    foo(land)
    print(result)
    visited[land] = true
    
    func foo(_ node: Int) {
        if node == 1 { return }
        
        if visited[node] {
            result = node
        }
        
        foo(node / 2)
    }
}
