let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var sessions = [(a: Int, b: Int, c: Int)]()

for _ in 0..<n {
  let abc = readLine()!.split(separator: " ").map { Int($0)! }
  let (a, b, c) = (abc[0], abc[1], abc[2])
  sessions.append((a, b, c))
}


let ab = sessions.map { $0.a + $0.b }.sorted(by: >)
let bc = sessions.map { $0.b + $0.c }.sorted(by: >)
let ac = sessions.map { $0.a + $0.c }.sorted(by: >)

func findMaximumValue(_ arr: [Int]) -> Int {
  return arr.prefix(k).reduce(0, +)
}

print(max(findMaximumValue(ab), findMaximumValue(bc), findMaximumValue(ac)))

