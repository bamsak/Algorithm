let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (coin, m) = (nm[0] * 100, nm[1])
print(coin >= m ? "Yes" : "No")