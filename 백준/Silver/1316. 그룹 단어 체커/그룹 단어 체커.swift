var result = 0
for _ in 0..<Int(readLine()!)! {
  let str = readLine()!.map { $0 }
  var dict = [Character: Int]()
  var check = true
  
  for i in 0..<str.count {
    if let prevI = dict[str[i]] {
      if i - prevI > 1 {
        check = false
        break
      } else {
        dict[str[i]] = i
      }
      
    } else {
      dict[str[i]] = i
    }
  }
  
  if check {
    result += 1
  }
}

print(result)