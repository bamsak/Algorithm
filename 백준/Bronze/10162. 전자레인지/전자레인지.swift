var (a, b, c) = (0, 0, 0)

var time = Int(readLine()!)!

while time > 0 {
    if time >= 300 {
        a += 1
        time -= 300
    }
    
    if time >= 60 {
        b += 1
        time -= 60
    }
    
    if time >= 10 {
        c += 1
        time -= 10
    } else {
        break
    }
}

print(time == 0 ? "\(a) \(b) \(c)" : -1)
