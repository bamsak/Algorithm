import Foundation

let nm =  readLine()!.split(separator: " ").map{ Int($0)! }
let cards = readLine()!.split(separator: " ").map{ Int($0)! }

var card = -10000
for i in 0..<(nm[0] - 2) {
    for j in (i + 1)..<(nm[0] - 1) {
        for r in (j + 1)..<(nm[0]) {
            let new = cards[i] + cards[j] + cards[r]
            if new <= nm[1] {
                if nm[0] - card > nm[0] - new {
                    card = new
                }
            }
        }
    }
}
print(card)