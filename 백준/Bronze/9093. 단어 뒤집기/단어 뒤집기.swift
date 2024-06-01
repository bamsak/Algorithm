for _ in 0..<Int(readLine()!)! {
    print(readLine()!.split(separator: " ").map { String($0.reversed()) }.joined(separator: " "))
}