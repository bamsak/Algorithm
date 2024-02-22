var scores = [(idx: Int, score: Int)]()

for i in 1...8 {
    scores.append((i, Int(readLine()!)!))
}

var total = 0
var sub = [Int]()

for score in scores.sorted(by: { $0.score > $1.score })[0...4] {
    total += score.score
    sub.append(score.idx)
}

print(total)
print(sub.sorted().map{ String($0) }.joined(separator: " "))