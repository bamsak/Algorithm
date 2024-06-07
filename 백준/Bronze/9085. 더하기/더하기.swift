for _ in 0..<Int(readLine()!)! {
    _ = readLine()
    print(readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +))
}