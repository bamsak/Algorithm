let wh = readLine()!.split(separator: " ").map { Int($0)!}
let (w, h) = (wh[0], wh[1])
let n = Int(readLine()!)!

var coord = [(x: Int, y: Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    switch input[0] {
    case 1:
        coord.append((input[1], 0))
    case 2:
        coord.append((input[1], h))
    case 3:
        coord.append((0, input[1]))
    default:
        coord.append((w, input[1]))
    }
}

let temp = readLine()!.split(separator: " ").map { Int($0)! }

var start = (x: 0, y: 0)

switch temp[0] {
case 1:
    start = (temp[1], 0)
case 2:
    start = (temp[1], h)
case 3:
    start = (0, temp[1])
default:
    start = (w, temp[1])
}

func foo(_ x: Int, _ y: Int) -> Int {
    if y == 0 { return x }
    if x == w { return w + y }
    if y == h { return w + h + (w - x) }
    return 2 * w + h + (h - y)
}

let totalDis = (w + h) * 2
var result = 0

for now in coord {
    let clock = abs(foo(start.x, start.y) - foo(now.x, now.y))
    let reverse = totalDis - clock
    result += min(clock, reverse)
}

print(result)
