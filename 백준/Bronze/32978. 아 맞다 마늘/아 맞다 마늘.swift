_ = readLine()
let arr = readLine()!.split(separator: " ").map { String($0) }
let temp = readLine()!.split(separator: " ").map { String($0) }

var s = Set<String>()
for a in temp {
  s.insert(a)
}

arr.forEach {
  if !s.contains($0) {
    print($0)
    return
  }
}