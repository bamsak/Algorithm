let c = Int(readLine()!)!
let v = Int(readLine()!)!

var connects = Array(repeating: Array(repeating: 0, count: 0), count: c + 1)
var visited = [Bool](repeating: false, count: c + 1)

var count = 0

for _ in 0..<v {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    connects[input[0]].append(input[1])
    connects[input[1]].append(input[0])
}

var stack = [1]
visited[1] = true

while stack.isEmpty == false {
    let vertex = stack.removeLast()
    for connect in connects[vertex] {
        if visited[connect] == false {
            visited[connect] = true
            stack.append(connect)
            count += 1
        }
    }
}

print(count)
