let ksn = readLine()!.split(separator: " ").map { String($0) }
let (k, s, n) = (ksn[0].map { String($0) }, ksn[1].map { String($0) }, Int(ksn[2])!)
var king = (k[0].asInt(), Int(k[1])!)
var stone = (s[0].asInt(), Int(s[1])!)

extension String {
  func asInt() -> Int {
    Int(Character(self).asciiValue! - Character("A").asciiValue!) + 1
  }
}

extension Int {
  func asString() -> String {
    String(Character(UnicodeScalar(UInt8(self) + Character("A").asciiValue! - 1)))
  }
}

var direction = [
  "R": (1, 0), "L": (-1, 0), "B": (0, -1), "T": (0, 1),
  "RT": (1, 1), "LT": (-1, 1), "RB": (1, -1), "LB": (-1, -1)
  ]

for _ in 0..<n {
  let input = readLine()!
  let newD = direction[input]!
  
  let temp = (king.0 + newD.0, king.1 + newD.1)
  
  if temp.0 < 1 || temp.0 > 8 || temp.1 < 1 || temp.1 > 8 { continue }
  
  if temp == stone {
    let newS = (stone.0 + newD.0, stone.1 + newD.1)
    if newS.0 < 1 || newS.0 > 8 || newS.1 < 1 || newS.1 > 8 { continue }
    stone = newS
  }
  king = temp
}

print("\(king.0.asString())\(king.1)")
print("\(stone.0.asString())\(stone.1)")