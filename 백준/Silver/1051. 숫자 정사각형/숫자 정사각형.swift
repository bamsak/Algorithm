let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var rectangle = Array(repeating: Array(repeating: 0, count: 0), count: 0)

for _ in 0..<n {
    rectangle.append(readLine()!.map { Int(String($0))! })
}

var result = 1
let maximumLength = min(n, m)

for i in 1..<maximumLength {
    for y in 0..<n - i {
        for x in 0..<m - i {
            let leftTop = rectangle[y][x]
            let leftBottom = rectangle[y + i][x]
            let rightTop = rectangle[y][x + i]
            let rightBottom = rectangle[y + i][x + i]
            if leftTop == leftBottom && leftBottom == rightTop && rightTop == rightBottom {
                let side = i + 1
                result = side * side
            }
        }
    }
}
print(result)