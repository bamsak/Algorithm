let n = Int(readLine()!)!
let sgpd = readLine()!.split(separator: " ").map { Int($0)! }
let (s, g, p, d) = (sgpd[0], sgpd[1], sgpd[2], sgpd[3])

let ranks = readLine()!
var result = 0
var prev = 0

for rank in ranks {
  switch rank {
    case "B":
    result += s - 1 - prev
    prev = s - 1 - prev
    case "S":
    result += g - 1 - prev
    prev = g - 1 - prev
    case "G":
    result += p - 1 - prev
    prev = p - 1 - prev
    case "P":
    result += d - 1 - prev
    prev = d - 1 - prev
    default:
    result += d
    prev = d
  }
}

print(result)