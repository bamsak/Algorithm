let n = Int(readLine()!)!
let m = Int(readLine()!)!

var friends = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    friends[input[0]].append(input[1])
    friends[input[1]].append(input[0])
}

var result = 0
var stack = [(num: Int, distance: Int)]()
stack.append((1, 0))
visited[1] = true

while !stack.isEmpty {
    let current = stack.removeLast()
    if current.distance > 1 {
        continue
    }
    for friend in friends[current.num] where !visited[friend] {
        stack.append((friend, current.distance + 1))
        visited[friend] = true
        result += 1
    }
}
print(result)
