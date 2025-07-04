let x = Int(readLine()!)!
var line: [Character] = readLine()!.map { $0 }.reversed()

var wCount = 0
var mCount = 0

while let current = line.last {
  let wm = current == "W" ? true : false // true면 여자 false면 남자
  
  if wm {
    wCount += 1
  } else {
    mCount += 1
  }
  
  let diff = abs(wCount - mCount)
  
  guard diff > x 
  else {
    line.removeLast()
    continue
  }
  
  if wm {
    wCount -= 1
  } else {
    mCount -= 1
  }
  
  if line.count < 2 { break }
  
  line.swapAt(line.count - 1, line.count - 2)
  
  guard let temp = line.last, (temp == "W") != wm else { break }

  
  if temp == "W" {
    wCount += 1
  } else {
    mCount += 1
  }
  line.removeLast()
}

print(wCount + mCount)