let nkl = readLine()!.split(separator: " ").map { Int($0)! }
var (k, l) = (nkl[1], nkl[2])

var result = 0

while k != l {
    k = k / 2 + k % 2
    l = l / 2 + l % 2
    result += 1
}

print(result == 0 ? -1 : result)