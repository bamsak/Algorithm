let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let scores = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

print(scores[k - 1])
