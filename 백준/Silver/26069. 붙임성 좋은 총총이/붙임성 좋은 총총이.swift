var temp: Set<String> = ["ChongChong"]
var meet = false
for _ in 0..<Int(readLine()!)! {
  let name = readLine()!.split(separator: " ").map { String($0) }
  
  if temp.contains(name[0]) || temp.contains(name[1]) {
    temp.insert(name[0])
    temp.insert(name[1])
  }
}

print(temp.count)