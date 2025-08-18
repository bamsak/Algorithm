while let input = readLine(), let n = Int(input) {
  var temp = 1
  var result = 1
  while true {
    if temp % n == 0 {
      print(result)
      break
    }
    temp = (temp * 10 + 1) % n
    result += 1
  }
}