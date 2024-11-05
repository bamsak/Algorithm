var words = Set<String>()
for _ in 0..<Int(readLine()!)! {
    let temp = readLine()!.sorted().map { String($0) }.joined()
    words.insert(temp)
}

print(words.count)