let S = readLine()!.map { String($0) }
var sum: Float = 0
var scount = 0
for s in S {
    switch s {
    case "A":
        sum += 4.0
    case "B":
        sum += 3.0
    case "C":
        sum += 2.0
    case "D":
        sum += 1.0
    case "F":
        sum += 0.0
    default:
        sum += 0.5
        continue
    }
    scount += 1
}
print(sum / Float(scount))