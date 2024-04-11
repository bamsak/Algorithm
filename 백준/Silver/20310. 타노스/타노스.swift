let S = readLine()!.map { String($0) }

var zero = [String]()
var one = [String]()

for s in S {
    if s == "0" {
        zero.append(s)
        continue
    }
    one.append(s)
}

var result = ""

for i in 0..<zero.count / 2 {
    result += zero[i]
}

for i in 0..<one.count / 2 {
    result += one[i]
}

print(result)