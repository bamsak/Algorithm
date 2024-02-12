let s = readLine()!
let z = s.split(separator: "0")
let o = s.split(separator: "1")

print(min(z.count, o.count))