let pm = readLine()!.split(separator: " ").map { Int($0)! }
let (p, m) = (pm[0], pm[1])
var arr = [[(l: Int, n: String)]]()

for _ in 0..<p {
  let ln = readLine()!.split(separator: " ").map { String($0) }
  let (l, n) = (Int(ln[0])!, ln[1])
  if arr.isEmpty {
    arr.append([(l, n)])
    continue
  }
  
  var check = false
  
  for i in 0..<arr.count {
    if arr[i].count == m {
      continue
    }
    if let first = arr[i].first, abs(first.l - l) <= 10 {
      arr[i].append((l, n))
      check = true
      break
    }
  }
  
  if !check {
    arr.append([(l, n)])
  }
}

var result = ""

arr.forEach {
  if $0.count == m {
    result += "Started!\n"
  } else {
    result += "Waiting!\n"
  }
  
  $0.sorted { $0.n < $1.n }.forEach {
    result += "\($0.l) \($0.n)\n"
  }
}

print(result)