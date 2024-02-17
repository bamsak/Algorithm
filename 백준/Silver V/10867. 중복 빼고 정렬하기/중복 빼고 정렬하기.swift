let n = Int(readLine()!)!
let x = Set(readLine()!.split(separator: " ").map { Int($0)! }).sorted()
var r = ""
x.forEach { r.append("\($0) ") }

print(r)