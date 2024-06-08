for _ in 0..<Int(readLine()!)! {
    print(readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)[2])
}