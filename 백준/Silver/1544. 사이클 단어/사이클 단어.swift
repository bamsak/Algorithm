import Foundation

var arr = [String]()

for _ in 0..<Int(readLine()!)! {
  let str = readLine()!
  
  var temp = false
  
  for s in arr where s.count == str.count{
    let new = s + s
    
    if new.range(of: str) != nil {
      temp = true
      break
    }
  }
  
  if !temp {
    arr.append(str)
  }
}

print(arr.count)