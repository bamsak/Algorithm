let ab = readLine()!.split(separator: " ")
let (a, b) = (ab[0].map { String($0) }, ab[1].map { String($0) })

var result = Int.max
for i in 0...b.count - a.count {
    var temp = 0
    for j in 0..<a.count where a[j] != b[j + i] {
        temp += 1
    }
    result = min(temp, result)
}

print(result)