let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var password = [String: String]()

for _ in 0..<n {
    let site = readLine()!.split(separator: " ")
    password[String(site[0])] = String(site[1])
}

for _ in 0..<m {
    let input = readLine()!
    print(password[input]!)
}