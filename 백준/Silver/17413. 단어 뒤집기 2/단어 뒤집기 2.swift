let S = readLine()!
var trigger = false
var temp = ""
var result = ""

for s in S {
    if s == "<" {
        trigger = true
        result += temp.reversed() + String(s)
        temp = ""
        continue
    }
    
    if s == ">" {
        trigger = false
        result += String(s)
        continue
    }
    
    if !trigger && s == " " {
        result += temp.reversed() + " "
        temp = ""
        continue
    }
    
    if !trigger {
        temp += String(s)
        continue
    }
    
    result += String(s)
}

if !temp.isEmpty {
    result += temp.reversed()
}
print(result)