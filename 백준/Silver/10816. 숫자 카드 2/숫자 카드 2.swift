let n = Int(readLine()!)!
let nCards = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let mCards = readLine()!.split(separator: " ").map { Int($0)! }

var dict = [Int: Int]()
var result = ""

for card in nCards {
    if dict[card] == nil {
        dict[card] = 1
        continue
    }
    dict[card]! += 1
}

for card in mCards {
    guard let value = dict[card] 
    else {
        result += "0 "
        continue
    }
    result += "\(value) "
}

print(result)