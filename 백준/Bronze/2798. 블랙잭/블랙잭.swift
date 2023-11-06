let nm =  readLine()!.split(separator: " ").map{ Int($0)! }
let cards = readLine()!.split(separator: " ").map{ Int($0)! }

var arr = [Int]()
for i in 0..<(nm[0] - 2) {
    for j in (i + 1)..<(nm[0] - 1) {
        for r in (j + 1)..<(nm[0]) {
            if cards[i] + cards[j] + cards[r] <= nm[1] {
                arr.append(cards[i] + cards[j] + cards[r])
            }
        }
    }
}
arr.sort(by: <)
print("\(arr.last!)")
