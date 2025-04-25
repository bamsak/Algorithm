let n = Int(readLine()!)!

let coords = readLine()!.split(separator: " ").map { Int($0)! }
let times = readLine()!.split(separator: " ").map { Int($0)! }

var info = [(coord: Int, time: Int)]()

var totalTime = 0
for i in 0..<n {
  info.append((coords[i], times[i]))
}

var result = 0
var prev = 0

for i in (0..<n).reversed() {
    result += max(abs(info[i].coord - prev), info[i].time - result)
    prev = info[i].coord
}

print(result + prev)
