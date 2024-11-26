let n = Int(readLine()!)!
let str = readLine()!
var count = (r: 0, b: 0)
var previous: Character = "a"

for s in str where previous != s {
    if s == "B" {
        count.b += 1
    } else {
        count.r += 1
    }
    previous = s
}

print(min(count.b, count.r) + 1)