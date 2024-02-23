let nd = readLine()!.split(separator: " ")
let (n, d) = (Int(nd[0])!, nd[1])

var result = 0
for i in 1...n {
    let str = Array(String(i))
    str.forEach {
        if String($0) == d {
            result += 1
        }
    }
}

print(result)