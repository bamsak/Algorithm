for _ in 0..<Int(readLine()!)! {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, m) = (nm[0], nm[1])
  var result = 0
  
  for num in n...m {
    result += String(num).filter { $0 == "0" }.count  
  }
  print(result)
}
