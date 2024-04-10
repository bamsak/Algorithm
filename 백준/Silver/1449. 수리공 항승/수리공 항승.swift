let nl = readLine()!.split(separator: " ").map { Int($0)! }
let (n, l) = (nl[0], nl[1])

let waterLeaks = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var previous = waterLeaks[0]
var result = 1

for waterLeak in waterLeaks {
    if waterLeak - previous >= l {
        result += 1
        previous = waterLeak
    }
}

print(result)