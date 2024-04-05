let bcd = readLine()!.split(separator: " ").map { Int($0)! }
let (b, c, d) = (bcd[0], bcd[1], bcd[2])

var burgerP = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var sideP = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var drinkP = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let m = min(b, c, d)
let total = burgerP.reduce(0, +) + sideP.reduce(0, +) + drinkP.reduce(0, +)
var set = 0

for _ in 0..<m {
    let sp = burgerP.removeLast() + sideP.removeLast() + drinkP.removeLast()
    set += Int(Double(sp) * 0.9)
}

while !burgerP.isEmpty {
    set += burgerP.removeLast()
}

while !sideP.isEmpty {
    set += sideP.removeLast()
}
while !drinkP.isEmpty {
    set += drinkP.removeLast()
}

print(total)
print(set)
