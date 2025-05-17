var list = Set<String>()

for _ in 0..<Int(readLine()!)! * 2 - 1 {
    let name = readLine()!
    if list.contains(name) {
        list.remove(name)
    } else {
        list.insert(name)
    }
}
print(list.first!)

