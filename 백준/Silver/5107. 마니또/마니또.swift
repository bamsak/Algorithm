var curr = 1

while let input = readLine(), let num = Int(input), num != 0 {
  var dict = [String: String]()
  var visited = Set<String>()

  for _ in 0..<num {
    let ab = readLine()!.split(separator: " ").map { String($0) }
    let (a, b) = (ab[0], ab[1])
    dict[a] = b
  }
  
  var count = 0
  
  for now in dict.keys {
    if visited.contains(now) { continue }
    var temp = now
    
    while !visited.contains(temp) {
      visited.insert(temp)
      temp = dict[temp]!
    }
    
    count += 1
  }
  print("\(curr) \(count)")
  curr += 1
}

