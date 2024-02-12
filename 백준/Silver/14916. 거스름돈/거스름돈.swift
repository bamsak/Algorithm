var n = Int(readLine()!)!
var result = 0

while n > 0 {
    if n % 5 == 0 {
        result += n / 5
        n = 0
        break
    }
    n -= 2
    result += 1
}

n == 0 ? print(result) : print(-1)