var money = 1000 - Int(readLine()!)!
var chages = [500, 100, 50, 10, 5, 1]
var result = 0

for chage in chages {
    result += money / chage
    money %= chage
}

print(result)