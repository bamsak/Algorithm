var str = [String]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.map { String($0) }
    
    if str.isEmpty {
        str = input
        continue
    }
    
    for i in 0..<str.count where input[i] != str[i] {
        str[i] = "?"
    }
}

print(str.joined())