let rcq = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, q) = (rcq[0], rcq[1], rcq[2])
var picture = [[Int]]()

for _ in 0..<r {
    picture.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var psum: [[Int]] = Array(repeating: Array(repeating: 0, count: c + 1), count: r + 1)

for y in 1...r {
    for x in 1...c {
        psum[y][x] = psum[y][x - 1] + psum[y - 1][x] - psum[y - 1][x - 1] + picture[y - 1][x - 1]
    }
}
var result = ""

for _ in 0..<q {
    let yx = readLine()!.split(separator: " ").map { Int($0)! }
    let (y1, x1, y2, x2) = (yx[0], yx[1], yx[2], yx[3])
    let count = (y2 - y1 + 1) * (x2 - x1 + 1)
    result += "\((psum[y2][x2] - psum[y1 - 1][x2] - psum[y2][x1 - 1] + psum[y1 - 1][x1 - 1]) / count)\n"
}

print(result)
