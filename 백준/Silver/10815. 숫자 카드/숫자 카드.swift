let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let mCards = readLine()!.split(separator: " ").map { Int($0)! }

var result = ""

for card in mCards {
    var left = 0
    var right = n - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if card <= cards[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    if left >= n {
        left -= 1
    }
    let str = card == cards[left] ? "1 " : "0 "
    result += str
}
print(result)
