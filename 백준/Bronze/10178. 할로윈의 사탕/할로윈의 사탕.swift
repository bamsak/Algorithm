for _ in 0..<Int(readLine()!)! {
    let cch = readLine()!.split(separator: " ").map { Int($0)!}
    let (c, ch) = (cch[0], cch[1])
    
    print("You get \(c / ch) piece(s) and your dad gets \(c % ch) piece(s).")
}