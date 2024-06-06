let ab = readLine()!.split(separator: " ")
let a = Set<Int>(readLine()!.split(separator: " ").map { Int($0)! })
let b = Set<Int>(readLine()!.split(separator: " ").map { Int($0)! })
let ac = a.subtracting(b).count
let bc = b.subtracting(a).count
print(ac + bc)