let n = Int(readLine()!)!
var drinks = readLine()!.split(separator: " ").map { Double($0)! }.sorted(by: >)

while drinks.count > 1 {
    let drink = drinks.removeLast()
    drinks[0] += drink / 2
}

print(drinks.first!)