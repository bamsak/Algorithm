let n = Int(readLine()!)!
var arr = [String]()
var visited = [Bool](repeating: false, count: n)

func foo(_ depth: Int) {
    if depth == 0 {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            arr.append("\(i + 1)")
            visited[i] = true
            foo(depth - 1)
            visited[i] = false
            _ = arr.popLast()
        }
    }
}
foo(n)