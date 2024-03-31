let xy = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y) = (xy[0], xy[1])
var result = 0
x < y ? (result = x + y + (x / 10)) : (result = x + y + (y / 10))
print(result)