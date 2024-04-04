let n = Int(readLine()!)!
let trees = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var i = 1
var sum = 0

for tree in trees {
    let new = tree + i
    i += 1
    if sum < new {
        sum = new
    }
}

print(sum + 1)