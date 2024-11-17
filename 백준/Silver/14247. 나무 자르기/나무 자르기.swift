let n = Int(readLine()!)!
let (h, a) = (readLine()!.split(separator: " ").map { Int($0)! }, readLine()!.split(separator: " ").map { Int($0)! })
let trees: [(h: Int, a: Int)] = zip(h, a).sorted { $0.1 < $1.1 }
var result = 0

for i in 0..<n {
    result += trees[i].h + trees[i].a * i
}

print(result)