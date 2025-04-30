var n = Int(readLine()!)!
var result = 0
while n % 5 != 0 && n > 0 {
  n -= 3
  result += 1
}

print(n % 5 == 0 ? result + (n / 5) : -1)