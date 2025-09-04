var temp = 0.0
var sum = 0.0
for _ in 0..<20 {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (b, c) = (Double(input[1])!, input[2])
    if c == "P" {
        continue
    }
    temp += b
    sum += b * foo(c)
}

print(sum / temp)

func foo(_ c: String) -> Double {
    switch c {
    case "A+":
        return 4.5
    case "A0":
        return 4.0
    case "B+":
        return 3.5
    case "B0":
        return 3.0
    case "C+":
        return 2.5
    case "C0":
        return 2.0
    case "D+":
        return 1.5
    case  "D0":
        return 1.0
    default:
        return 0
    }
}
