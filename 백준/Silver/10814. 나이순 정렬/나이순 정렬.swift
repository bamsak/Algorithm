let n = Int(readLine()!)!
var users = [(age: Int, name: String)]()
var result = ""
for _ in 0..<n {
    let user = readLine()!.split(separator: " ")
    users.append((Int(user[0])!, String(user[1])))
}

users.sorted { $0.age < $1.age }.forEach {
    result += "\($0.age) \($0.name) \n"
}
print(result)