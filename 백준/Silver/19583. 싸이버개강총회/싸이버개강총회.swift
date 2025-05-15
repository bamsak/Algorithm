let seq = readLine()!.split(separator: " ").map { String($0) }
let (ts, te, tq) = (seq[0].split(separator: ":").map { Int($0)! }, seq[1].split(separator: ":").map { Int($0)! }, seq[2].split(separator: ":").map { Int($0)! })
let (s, e, q) = (ts[0] * 60 + ts[1], te[0] * 60 + te[1], tq[0] * 60 + tq[1])

var dict = [String: Bool]()

while let str = readLine() {
  let input = str.split(separator: " ").map { String($0) }
  let temp = input[0].split(separator: ":").map { Int($0)!}
  let (time, name) = (temp[0] * 60 + temp[1], input[1])
  
  if time <= s {
    dict[name] = true
    continue
  }
  
  guard dict[name] != nil else { continue }
  
  if time >= e && time <= q {
    dict[name] = false
  }
}

print(dict.filter { !$0.value }.count)