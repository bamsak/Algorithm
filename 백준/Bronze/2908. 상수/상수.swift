let ab = readLine()!.split(separator: " ")
let a = Int(ab[0].map { Int(String($0))! }.reversed().map { String($0) }.joined())!
let b = Int(ab[1].map { Int(String($0))! }.reversed().map { String($0) }.joined())!
a > b ? print(a) : print(b)