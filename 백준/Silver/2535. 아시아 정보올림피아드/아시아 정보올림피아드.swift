var arr = [(c: Int, s: Int, score: Int)]()

for _ in 0..<Int(readLine()!)! {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    arr.append((a, b, c))
}

var dict = [Int: Int]()
var result = [String]()
arr.sort { $0.score > $1.score }

for i in arr {
    if result.count > 2 { break }
    
    if let count = dict[i.c] {
      if count > 1 { continue }
        dict[i.c]! += 1
    } else {
        dict[i.c] = 1
    }
    
    result.append("\(i.c) \(i.s)")
}

print(result.joined(separator: "\n"))
