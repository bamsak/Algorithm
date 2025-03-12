let n = Int(readLine()!)!
let map = readLine()!.map { $0 }

var result = 0

for i in 1..<n {
    if map[i] == "W" && map[i - 1] == "E" {
        result += 1
    }
}

if map.first! == "W" {
    result += 1
}

if map.last! == "E" {
    result += 1
}
print(result)
