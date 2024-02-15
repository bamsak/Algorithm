var result = ""

for _ in 0..<Int(readLine()!)! {
    var total = 0
    var arr = [Int]()
    var dict = [Int: Int]()
    
    let count = Int(readLine()!)!
    for i in 0..<count{
        let vote = Int(readLine()!)!
        total += vote
        arr.append(vote)
        dict[vote] = i + 1
    }
    
    let min = arr.min()!
    let max = arr.max()!
    let half = Double(total) / 2
    
    let maxCount = arr.filter { $0 == max }.count
    
    if min == max || maxCount > 1 {
        result += "no winner\n"
        continue
    }
    
    if half < Double(max) {
        result += "majority winner \(dict[max]!)\n"
        continue
    }
    
    if half >= Double(max) {
        result += "minority winner \(dict[max]!)\n"
    }
}

print(result)