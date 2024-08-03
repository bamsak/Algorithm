let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var arr = [String]()

func foo(_ depth: Int, _ start: Int) {
    if depth == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in start..<n {
        arr.append("\(i + 1)")
        foo(depth + 1, i)
        _ = arr.popLast()
    }
}
foo(0, 0)