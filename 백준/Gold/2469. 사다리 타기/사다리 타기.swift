let k = Int(readLine()!)!
let y = Int(readLine()!)!

var map = [[Character]]()
var end = readLine()!.map { $0 }

var target = 0

for i in 0..<y {
    let input = readLine()!.map { $0 }
    if input[0] == "?" {
        target = i
    }
    map.append(input)
}

var start = end.sorted()
var result = Array(repeating: "*", count: k - 1)

for y in 0..<target {
    for x in 0..<k - 1 where map[y][x] == "-" {
        start.swapAt(x, x + 1)
    }
}

for y in (target + 1..<y).reversed() {
    for x in 0..<k - 1 where map[y][x] == "-" {
        end.swapAt(x, x + 1)
    }
}

for i in 0..<k - 1 where start[i] != end[i] {
    if start[i] == end[i + 1] && start[i + 1] == end[i] {
        result[i] = "-"
        start.swapAt(i, i + 1)
    } else {
        result = Array(repeating: "x", count: k - 1)
        break
    }
}

print(result.joined())