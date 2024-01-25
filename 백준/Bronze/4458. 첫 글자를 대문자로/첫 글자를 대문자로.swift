for _ in 0..<Int(readLine()!)! {
    var input = String(readLine()!.reversed())
    let first = input.removeLast().uppercased()
    input.append(first)
    print(String(input.reversed()))
}
