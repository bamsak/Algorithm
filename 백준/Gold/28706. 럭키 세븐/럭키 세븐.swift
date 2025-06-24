for _ in 0..<Int(readLine()!)! {
  let n = Int(readLine()!)!
  var check = [Bool](repeating: false, count: 7)
  check[1] = true
  
  for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let (op1, op2) = (input[0], input[2])
    let (num1, num2) = (Int(input[1])!, Int(input[3])!)
    
    var temp = [Bool](repeating: false, count: 7)
    
    for i in 0..<7 where check[i] {
      let new1 = op1 == "+" ? (i + num1) % 7 : (i * num1) % 7
      let new2 = op2 == "+" ? (i + num2) % 7 : (i * num2) % 7
      
      temp[new1] = true
      temp[new2] = true
    }
    
    check = temp
  }
  
  print(check[0] ? "LUCKY" : "UNLUCKY")
}