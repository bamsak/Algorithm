var set = Set<String>()
var result = 0
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!
    if input == "ENTER" {
        set.removeAll()
        continue
    }
    result += set.contains(input) ? 0 : 1
    set.insert(input)
}

print(result)