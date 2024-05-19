let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var dict = [String: Int]()

for _ in 0..<n  {
    let word = readLine()!
    if word.count < m { continue }
    
    if let _ = dict[word] {
        dict[word]! += 1
        continue
    }
    dict[word] = 1
}

dict.sorted {
    if $0.value == $1.value {
        if $0.key.count == $1.key.count {
            return $0.key < $1.key
        }
        return $0.key.count > $1.key.count
    }
    return $0.value > $1.value
}.forEach { print($0.key) }