var dict = [String: Int]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: ".")
    
    if dict["\(input[1])"] != nil {
        dict["\(input[1])"]! += 1
    } else {
        dict["\(input[1])"] = 1
    }
}

dict.sorted { $0.key < $1.key }.forEach {
    print("\($0.key) \($0.value)")
}