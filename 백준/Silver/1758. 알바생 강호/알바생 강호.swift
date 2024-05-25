let n = Int(readLine()!)!
var ranks = [Int]()
var result = 0

for _ in 0..<n {
    ranks.append(Int(readLine()!)!)
}

ranks.sort(by: >)

for i in 0..<ranks.count {
    let tip = ranks[i] - foo(i + 1)
    if tip > 0 {
        result += tip
    }
}

print(result)

func foo(_ rank: Int) -> Int {
    return rank - 1
}
