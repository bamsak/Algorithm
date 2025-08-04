let n = Int(readLine()!)! 
let heights = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = 0
for h in heights {
    result = (result + result + h) % 1_000_000_007
}

print(result)
