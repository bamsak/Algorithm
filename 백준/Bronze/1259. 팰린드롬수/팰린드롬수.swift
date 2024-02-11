var result = ""

while true {
    let i = readLine()!
    if i == "0" {
        break
    }
    if i == String(i.reversed()) {
        result += "yes\n"
    } else {
        result += "no\n"
    }
}

print(result)
