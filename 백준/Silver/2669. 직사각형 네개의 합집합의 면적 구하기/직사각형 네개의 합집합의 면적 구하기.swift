var plane = Array(repeating: Array(repeating: 0, count: 100), count: 100)

for _ in 0..<4 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])

    for i in y1..<y2 {
        for j in x1..<x2 {
            plane[i - 1][j - 1] = 1
        }
    }
}

let totalArea = plane.flatMap { $0 }.reduce(0, +)

print(totalArea)
