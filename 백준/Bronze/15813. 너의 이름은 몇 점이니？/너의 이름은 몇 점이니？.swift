let _ = readLine()!
let n = readLine()!
print(n.map { Int(UnicodeScalar(String($0))!.value) - 64 }.reduce(0, +))