let n = Int(readLine()!)!
var cards = [Int]()
var coords = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
    let card = Int(readLine()!)!
    cards.append(card)
    coords[card] = i
}

var result = 0

for i in 1..<n where coords[i] > coords[i + 1] {
    result += 1
}

print(result)