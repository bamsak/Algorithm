let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = [String]()
var visited = Array(repeating: 0, count: n)

func foo(_ depth: Int) {
    if depth == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if visited[i] < m {
            visited[i] += 1
            arr.append("\(i + 1)")
            foo(depth + 1)
            visited[i] -= 1
            arr.popLast()
        }
    }
}

foo(0)