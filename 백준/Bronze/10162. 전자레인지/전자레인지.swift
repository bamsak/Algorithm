var time = Int(readLine()!)!

var result = ""
result += "\(time / 300) "
time %= 300
result += "\(time / 60) "
time %= 60
result += "\(time / 10)"
time %= 10

print(time == 0 ? result : -1)

