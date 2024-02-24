let nl = readLine()!.split(separator: " ").map { Int($0)! }
let fruits = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var length = nl[1]

for fruit in fruits {
    if length >= fruit {
        length += 1
    } else {
        break
    }
}

print(length)