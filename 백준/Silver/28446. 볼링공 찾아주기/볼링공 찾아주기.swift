var dict = [Int: Int]()
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    if input.count > 2 {
        dict[input[2]] = input[1]
    } else {
        print(dict[input[1]]!)
    }
}
